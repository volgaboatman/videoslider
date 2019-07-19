import 'package:built_redux/built_redux.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:flutter/material.dart' hide Builder, ActionDispatcher;
import 'package:video_player/video_player.dart';

import 'store/actions.dart';
import 'store/state.dart';
import 'video_player.dart';

class VideoSliderWidget extends StatelessWidget {
  final Store<VideoSliderState, VideoSliderStateBuilder, CounterActions> store;

  VideoSliderWidget(this.store);

  VideoPlayerController _createController(String url) {
    if (url.startsWith("http")) return VideoPlayerController.network(url);
    return VideoPlayerController.asset(url);
  }

  @override
  Widget build(BuildContext context) => new ReduxProvider(
        store: store,
        child: new StoreConnection<VideoSliderState, CounterActions,
            VideoSliderState>(
          connect: (state) => state,
          builder: (BuildContext context, VideoSliderState state,
              CounterActions actions) {
            return Column(
              children: <Widget>[
                store.state.videos.length > 0
                    ? CarouselSlider(
                        height: 400.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index) {
                          actions.setPage(index);
                        },
                        items: store.state.videos.map((v) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Column(
                                children: <Widget>[
                                  VideoPlayerWidget(
                                      controller: _createController(v),
                                      autoPlay: v == store.state.videos.first,
                                      changesStream: store.nextState),
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
                  title: const Text('autoplay'),
                  value: store.state.isPlaying,
                  onChanged: (c) => actions.setIsPlaying(c),
                ),
                SwitchListTile(
                  title: const Text('mute'),
                  value: store.state.isMuted,
                  onChanged: (c) => actions.setIsMuted(c),
                ),
                Text(
                  'Current page: ${store.state.currentPage}',
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            );
          },
        ),
      );
}
