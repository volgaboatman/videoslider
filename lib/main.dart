import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';

import 'store/actions.dart';
import 'store/middleware.dart';
import 'store/reducers.dart';
import 'store/state.dart';
import 'video_slider.dart';

//void main() => runApp(VideoPlayerApp());

void main() {
  runApp(new VideoPlayerApp());
}

class VideoPlayerApp extends StatefulWidget {
  final store =
      Store<VideoSliderState, VideoSliderStateBuilder, VideoSliderActions>(
    reducerBuilder.build(),
    new VideoSliderState(),
    new VideoSliderActions(),
    middleware: [
      createVideoListMiddleware(),
    ],
  );

  @override
  State<StatefulWidget> createState() {
    return VideoPlayerAppState();
  }
}

class VideoPlayerAppState extends State<VideoPlayerApp> {
  Store<VideoSliderState, VideoSliderStateBuilder, VideoSliderActions> store;

  VideoPlayerAppState();

  @override
  void initState() {
    store = widget.store;

    store.actions.fetchVideoList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Player Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Video Carousel'),
          ),
          body: VideoSliderWidget(store: this.store),
        ));
  }
}
