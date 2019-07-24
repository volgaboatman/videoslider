// GENERATED CODE - DO NOT MODIFY BY HAND

part of example;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$CounterActions extends CounterActions {
  factory _$CounterActions() => new _$CounterActions._();
  _$CounterActions._() : super._();

  final ActionDispatcher<ControllerChanged> controllerChanged =
      new ActionDispatcher<ControllerChanged>(
          'CounterActions-controllerChanged');
  final ActionDispatcher<void> fetchVideoList =
      new ActionDispatcher<void>('CounterActions-fetchVideoList');
  final ActionDispatcher<List<String>> loaded =
      new ActionDispatcher<List<String>>('CounterActions-loaded');
  final ActionDispatcher<bool> setIsPlaying =
      new ActionDispatcher<bool>('CounterActions-setIsPlaying');
  final ActionDispatcher<bool> setIsMuted =
      new ActionDispatcher<bool>('CounterActions-setIsMuted');
  final ActionDispatcher<int> setPage =
      new ActionDispatcher<int>('CounterActions-setPage');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    controllerChanged.setDispatcher(dispatcher);
    fetchVideoList.setDispatcher(dispatcher);
    loaded.setDispatcher(dispatcher);
    setIsPlaying.setDispatcher(dispatcher);
    setIsMuted.setDispatcher(dispatcher);
    setPage.setDispatcher(dispatcher);
  }
}

class CounterActionsNames {
  static final ActionName<ControllerChanged> controllerChanged =
      new ActionName<ControllerChanged>('CounterActions-controllerChanged');
  static final ActionName<void> fetchVideoList =
      new ActionName<void>('CounterActions-fetchVideoList');
  static final ActionName<List<String>> loaded =
      new ActionName<List<String>>('CounterActions-loaded');
  static final ActionName<bool> setIsPlaying =
      new ActionName<bool>('CounterActions-setIsPlaying');
  static final ActionName<bool> setIsMuted =
      new ActionName<bool>('CounterActions-setIsMuted');
  static final ActionName<int> setPage =
      new ActionName<int>('CounterActions-setPage');
}
