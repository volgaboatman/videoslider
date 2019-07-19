library example;

import 'package:built_redux/built_redux.dart';

part 'actions.g.dart';

abstract class CounterActions extends ReduxActions {
  factory CounterActions() => new _$CounterActions();
  CounterActions._();

  ActionDispatcher<void> get fetchVideoList;
  ActionDispatcher<List<String>> get loaded;
  ActionDispatcher<bool> get setIsPlaying;
  ActionDispatcher<bool> get setIsMuted;
  ActionDispatcher<int> get setPage;
}
