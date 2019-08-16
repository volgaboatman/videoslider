library reducers;

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';

import 'actions.dart';
import 'state.dart';

ReducerBuilder<VideoSliderState, VideoSliderStateBuilder> reducerBuilder =
    new ReducerBuilder<VideoSliderState, VideoSliderStateBuilder>()
      ..add(VideoSliderActionsNames.loaded, (s, a, b) {
        b.isLoading = false;
        b.controllers = ListBuilder<VideoControllerState>();
        for (int i = 0; i < a.payload.length; i++) {
          b.controllers.add((VideoControllerStateBuilder()
                ..id = i
                ..url = a.payload[i]
                ..isPlaying = i == 0
                ..position = 0)
              .build());
        }
      })
      ..add(VideoSliderActionsNames.setIsMuted, (s, a, b) {
        b.isMuted = a.payload;
      })
      ..add(VideoSliderActionsNames.setPage, (s, a, b) {
        final oldItem = s.controllers[s.currentPage];
        final newItem = s.controllers[a.payload];

        b.controllers
          ..removeAt(s.currentPage)
          ..insert(
            s.currentPage,
            oldItem.rebuild((ib) => ib.isPlaying = false),
          )
          ..removeAt(a.payload)
          ..insert(
            a.payload,
            newItem.rebuild((ib) => ib.isPlaying = true),
          );

        b.currentPage = a.payload;
      });
