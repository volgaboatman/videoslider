library state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class VideoControllerState
    implements Built<VideoControllerState, VideoControllerStateBuilder> {
  static Serializer<VideoControllerState> get serializer =>
      _$videoControllerStateSerializer;
  VideoControllerState._();
  factory VideoControllerState([updates(VideoControllerStateBuilder b)]) =>
      _$VideoControllerState((b) => b
        ..position = 0
        ..volume = 0
        ..url = "");

  String get url;
  double get position;
  double get volume;
  bool get isPlaying;
}

abstract class VideoSliderState
    implements Built<VideoSliderState, VideoSliderStateBuilder> {
  static Serializer<VideoSliderState> get serializer =>
      _$videoSliderStateSerializer;

  VideoSliderState._();

  factory VideoSliderState([updates(VideoSliderStateBuilder b)]) =>
      _$VideoSliderState((b) => b
        ..isLoading = true
        ..isMuted = false
        ..controllers = ListBuilder<VideoControllerState>([])
        ..currentPage = 0
        ..update(updates));

  int get currentPage;
  BuiltList<VideoControllerState> get controllers;
  bool get isMuted;
  bool get isLoading;
}
