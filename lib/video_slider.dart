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
  Map<int, ChewieController> controllers;

  ChewieController _getController(VideoControllerState state) {
    if (controllers.containsKey(state.id)) return controllers[state.id];

    final newController = (state.url.startsWith("http"))
        ? VideoPlayerController.network(state.url)
        : VideoPlayerController.asset(state.url);
    newController.addListener(() => widget.store.actions
        .controllerChanged(ControllerChanged(state.url, newController.value)));

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

    controllers[state.id] = chewie;
    return chewie;
  }

  @override
  void initState() {
    super.initState();
    controllers = new Map<int, ChewieController>();
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

  Widget buildSlider(VideoSliderActions actions, VideoSliderState state) {
    return OrientationBuilder(builder: (context, orientation) {
      final initPage = state.currentPage;
      var content = [
        Expanded(
          flex: 3,
          child: CarouselSlider(
            enableInfiniteScroll: false,
            initialPage: initPage,
            onPageChanged: (index) {
              // Очень не тривиальная логика вычисления страницы если есть initialPage, зачем так сделали - не понятно
              // print("initPage: $initPage, index: $index");
              actions.setPage((index + initPage) % state.controllers.length);
            },
            items: state.controllers.map((c) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    key: Key(c.id.toString() +
                        c.isPlaying.toString() +
                        state.volume.toString()),
                    children: <Widget>[
                      VideoPlayerWidget(
                          controller: _getController(c),
                          isPlaing: c.isPlaying,
                          volume: state.volume),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
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
          ),
        ),
      ];

      return orientation == Orientation.portrait
          ? Column(children: content)
          : Row(children: content);
    });
  }
}
