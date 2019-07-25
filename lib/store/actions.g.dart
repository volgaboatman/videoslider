// GENERATED CODE - DO NOT MODIFY BY HAND

part of example;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$VideoSliderActions extends VideoSliderActions {
  factory _$VideoSliderActions() => new _$VideoSliderActions._();
  _$VideoSliderActions._() : super._();

  final ActionDispatcher<ControllerChanged> controllerChanged =
      new ActionDispatcher<ControllerChanged>(
          'VideoSliderActions-controllerChanged');
  final ActionDispatcher<void> fetchVideoList =
      new ActionDispatcher<void>('VideoSliderActions-fetchVideoList');
  final ActionDispatcher<List<String>> loaded =
      new ActionDispatcher<List<String>>('VideoSliderActions-loaded');
  final ActionDispatcher<bool> setIsMuted =
      new ActionDispatcher<bool>('VideoSliderActions-setIsMuted');
  final ActionDispatcher<int> setPage =
      new ActionDispatcher<int>('VideoSliderActions-setPage');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    controllerChanged.setDispatcher(dispatcher);
    fetchVideoList.setDispatcher(dispatcher);
    loaded.setDispatcher(dispatcher);
    setIsMuted.setDispatcher(dispatcher);
    setPage.setDispatcher(dispatcher);
  }
}

class VideoSliderActionsNames {
  static final ActionName<ControllerChanged> controllerChanged =
      new ActionName<ControllerChanged>('VideoSliderActions-controllerChanged');
  static final ActionName<void> fetchVideoList =
      new ActionName<void>('VideoSliderActions-fetchVideoList');
  static final ActionName<List<String>> loaded =
      new ActionName<List<String>>('VideoSliderActions-loaded');
  static final ActionName<bool> setIsMuted =
      new ActionName<bool>('VideoSliderActions-setIsMuted');
  static final ActionName<int> setPage =
      new ActionName<int>('VideoSliderActions-setPage');
}
