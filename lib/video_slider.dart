import 'package:built_redux/built_redux.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter/material.dart' hide Builder, ActionDispatcher;
import 'package:video_player/video_player.dart';

import 'store/actions.dart';
import 'store/state.dart';
import 'video_player.dart';

class VideoSliderWidget extends StatefulWidget {
  final Store<VideoSliderState, VideoSliderStateBuilder, CounterActions> store;

  VideoSliderWidget({Key key, @required this.store});

  @override
  _VideoSliderWidgetState createState() => _VideoSliderWidgetState();
}

class _VideoSliderWidgetState extends State<VideoSliderWidget> {
  Map<String, VideoPlayerController> controllers;

  VideoPlayerController _getController(String url) {
    if (controllers.containsKey(url)) return controllers[url];

    final newController = (url.startsWith("http"))
        ? VideoPlayerController.network(url)
        : VideoPlayerController.asset(url);
    newController.addListener(() => widget.store.actions
        .controllerChanged(ControllerChanged(url, newController.value)));

    newController.setLooping(true);
    //newController.initialize();

    controllers[url] = newController;
    return newController;
  }

  @override
  void initState() {
    super.initState();
    controllers = new Map<String, VideoPlayerController>();
  }

  @override
  void dispose() {
    controllers.values.forEach((c) => c.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => new ReduxProvider(
        store: widget.store,
        child: new StoreConnection<VideoSliderState, CounterActions,
            VideoSliderState>(
          connect: (state) => state,
          builder: (BuildContext context, VideoSliderState state,
              CounterActions actions) {
            return Column(
              children: <Widget>[
                state.controllers.length > 0
                    ? CarouselSlider(
                        height: 400.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index) {
                          actions.setPage(index);
                        },
                        items: state.controllers.map((c) {
                          print("${c.url}: ${c.isPlaying}");
                          return Builder(
                            builder: (BuildContext context) {
                              return Column(
                                //key: Key(c.url),
                                children: <Widget>[
                                  VideoPlayerWidget(
                                      controller: _getController(c.url),
                                      isPlaing: c.isPlaying,
                                      volume: c.volume),
                                ],
                              );
                            },
                          );
                        }).toList(),
                      )
                    : Container(
                        height: 400,
                        child: Center(child: CircularProgressIndicator())),
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
          },
        ),
      );
}
