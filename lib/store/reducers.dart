library reducers;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';

import 'actions.dart';
import 'state.dart';

ReducerBuilder<VideoSliderState, VideoSliderStateBuilder> reducerBuilder =
    new ReducerBuilder<VideoSliderState, VideoSliderStateBuilder>()
      ..add(CounterActionsNames.loaded, (s, a, b) {
        b.isLoading = false;
        b.controllers = ListBuilder<VideoControllerState>(a.payload
            .map<VideoControllerState>((v) => (VideoControllerStateBuilder()
                  ..url = v
                  ..isPlaying = false
                  ..position = 0
                  ..volume = 50)
                .build()));
      })
      ..add(CounterActionsNames.setIsPlaying, (s, a, b) {
//        setIsPlaying(s, a.payload);
      })
      ..add(CounterActionsNames.setIsMuted, (s, a, b) {
        b.isMuted = a.payload;
      })
      ..add(CounterActionsNames.setPage, (s, a, b) {
        final oldItem = s.controllers[s.currentPage];
        final newItem = s.controllers[a.payload];

        s.controllers.rebuild((listBuilder) => listBuilder
          ..removeAt(s.currentPage)
          ..insert(
            s.currentPage,
            oldItem.rebuild((ib) => ib.isPlaying = false),
          )
          ..removeAt(a.payload)
          ..insert(
            a.payload,
            newItem.rebuild((ib) => ib.isPlaying = true),
          ));
        b.currentPage = a.payload;
      });
