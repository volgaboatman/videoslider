import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoslider/store/state.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final bool autoPlay;
  final Stream<VideoSliderState> changesStream;

  VideoPlayerWidget(
      {Key key,
      @required this.controller,
      @required this.changesStream,
      this.autoPlay})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;
  ChewieController _chewieController;
  StreamSubscription subcsribtion;
  double _lastVolume = 50;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoInitialize: true,
      autoPlay: widget.autoPlay,
      looping: true,
      showControls: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );

    subcsribtion =
        widget.changesStream.listen((change) => onStoreStateChange(change));
    _controller.addListener(() {
      if (_controller.value.volume > 0) _lastVolume = _controller.value.volume;
    });
  }

  void onStoreStateChange(VideoSliderState change) {
    _chewieController.pause();
    _chewieController.setVolume(change.isMuted ? 0 : _lastVolume);

    String v = change.videos.firstWhere(
        (v) => change.videos[change.currentPage] == _controller.dataSource,
        orElse: () => null);
    if (v != null) {
      if (change.isPlaying) _chewieController.play();
    }
  }

  @override
  void dispose() {
    subcsribtion?.cancel();
    _controller.dispose();
    _chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
