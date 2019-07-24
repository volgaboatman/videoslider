library example;

import 'package:built_redux/built_redux.dart';
import 'package:video_player/video_player.dart';

part 'actions.g.dart';

class ControllerChanged {
  final String url;
  final VideoPlayerValue value;

  ControllerChanged(this.url, this.value);
}

abstract class CounterActions extends ReduxActions {
  factory CounterActions() => new _$CounterActions();
  CounterActions._();

  ActionDispatcher<ControllerChanged> get controllerChanged;
  ActionDispatcher<void> get fetchVideoList;
  ActionDispatcher<List<String>> get loaded;
  ActionDispatcher<bool> get setIsPlaying;
  ActionDispatcher<bool> get setIsMuted;
  ActionDispatcher<int> get setPage;
}
