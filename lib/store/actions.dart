library example;

import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';

part 'actions.g.dart';

class ControllerChanged {
  final String url;
  final VideoPlayerValue value;

  ControllerChanged(this.url, this.value);
}

abstract class VideoSliderActions extends ReduxActions {
  factory VideoSliderActions() => new _$VideoSliderActions();
  VideoSliderActions._();

  ActionDispatcher<ControllerChanged> get controllerChanged;
  ActionDispatcher<void> get fetchVideoList;
  ActionDispatcher<List<String>> get loaded;
  ActionDispatcher<bool> get setIsMuted;
  ActionDispatcher<int> get setPage;
}
