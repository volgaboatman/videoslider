library reducers;

import 'package:built_redux/built_redux.dart';

import 'actions.dart';
import 'state.dart';

ReducerBuilder<VideoSliderState, VideoSliderStateBuilder> reducerBuilder =
    new ReducerBuilder<VideoSliderState, VideoSliderStateBuilder>()
      ..add(CounterActionsNames.loaded, (s, a, b) {
        b.isLoading = false;
        b.videos.addAll(a.payload);
      })
      ..add(CounterActionsNames.setIsPlaying, (s, a, b) {
        b.isPlaying = a.payload;
      })
      ..add(CounterActionsNames.setIsMuted, (s, a, b) {
        b.isMuted = a.payload;
      })
      ..add(CounterActionsNames.setPage, (s, a, b) {
        b.currentPage = a.payload;
      });
