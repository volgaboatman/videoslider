library state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'state.g.dart';

abstract class VideoSliderState
    implements Built<VideoSliderState, VideoSliderStateBuilder> {
  static Serializer<VideoSliderState> get serializer =>
      _$videoSliderStateSerializer;

  VideoSliderState._();

  factory VideoSliderState([updates(VideoSliderStateBuilder b)]) =>
      _$VideoSliderState((b) => b
        ..isLoading = true
        ..isPlaying = true
        ..isMuted = false
        ..videos = ListBuilder<String>([])
        ..currentPage = 0
        ..update(updates));

  int get currentPage;
  BuiltList<String> get videos;
  bool get isMuted;
  bool get isLoading;
  bool get isPlaying;
}
