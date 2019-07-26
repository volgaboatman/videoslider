import 'package:built_redux/built_redux.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter/material.dart' hide Builder, ActionDispatcher;
import 'package:video_player/video_player.dart';

import 'store/actions.dart';
import 'store/state.dart';
import 'video_player.dart';

class VideoSliderWidget extends StatefulWidget {
  final Store<VideoSliderState, VideoSliderStateBuilder, VideoSliderActions>
      store;

  VideoSliderWidget({Key key, @required this.store});

  @override
  _VideoSliderWidgetState createState() => _VideoSliderWidgetState();
}

class _VideoSliderWidgetState extends State<VideoSliderWidget> {
  Map<String, ChewieController> controllers;

  ChewieController _getController(String url) {
    if (controllers.containsKey(url)) return controllers[url];

    final newController = (url.startsWith("http"))
        ? VideoPlayerController.network(url)
        : VideoPlayerController.asset(url);
    newController.addListener(() => widget.store.actions
        .controllerChanged(ControllerChanged(url, newController.value)));

    newController.setLooping(true);
    newController.addListener(
        () => widget.store.actions.setIsMuted(newController.value.volume == 0));

    final chewie = ChewieController(
      videoPlayerController: newController,
      autoInitialize: true,
      looping: true,
      showControls: true,
      allowFullScreen: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    controllers[url] = chewie;
    return chewie;
  }

  @override
  void initState() {
    super.initState();
    controllers = new Map<String, ChewieController>();
  }

  @override
  void dispose() {
    controllers.values.forEach((c) {
      c.videoPlayerController.dispose();
      c.dispose();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ReduxProvider(
        store: widget.store,
        child: StoreConnection<VideoSliderState, VideoSliderActions,
            VideoSliderState>(
          connect: (state) => state,
          builder: (BuildContext context, VideoSliderState state,
              VideoSliderActions actions) {
            return state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildSlider(actions, state);
          },
        ),
      );

  Column buildSlider(VideoSliderActions actions, VideoSliderState state) {
    return Column(
      children: [
        CarouselSlider(
          enableInfiniteScroll: false,
          onPageChanged: (index) {
            actions.setPage(index);
          },
          items: state.controllers.map((c) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  key: Key(
                      c.url + c.isPlaying.toString() + state.volume.toString()),
                  children: <Widget>[
                    VideoPlayerWidget(
                        controller: _getController(c.url),
                        isPlaing: c.isPlaying,
                        volume: state.volume),
                  ],
                );
              },
            );
          }).toList(),
        ),
        SwitchListTile(
          title: const Text('mute'),
          value: state.isMuted,
          onChanged: (c) => actions.setIsMuted(c),
        ),
        Text(
          'Current page: ${state.currentPage}',
          style: TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
