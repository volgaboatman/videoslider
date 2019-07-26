import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  final ChewieController controller;
  final bool isPlaing;
  final double volume;

  VideoPlayerWidget(
      {Key key,
      @required this.controller,
      @required this.isPlaing,
      this.volume})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    super.initState();

    widget.controller.setVolume(widget.volume);

    if (widget.isPlaing)
      widget.controller.play();
    else
      widget.controller.pause();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chewie(
        controller: widget.controller,
      ),
    );
  }
}
