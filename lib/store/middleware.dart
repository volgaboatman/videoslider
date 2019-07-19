// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:built_redux/built_redux.dart';

import 'actions.dart';
import 'state.dart';

Middleware<VideoSliderState, VideoSliderStateBuilder, CounterActions>
    createStoreTodosMiddleware() {
  return (MiddlewareBuilder<VideoSliderState, VideoSliderStateBuilder,
          CounterActions>()
        ..add(CounterActionsNames.fetchVideoList, doFetchVideoList()))
      .build();
}

MiddlewareHandler<VideoSliderState, VideoSliderStateBuilder, CounterActions,
    void> doFetchVideoList() {
  return (MiddlewareApi<VideoSliderState, VideoSliderStateBuilder,
              CounterActions>
          api,
      ActionHandler next,
      Action<void> action) {
    next(action);

    if (api.state.isLoading) {
      new Timer(Duration(seconds: 2), () {
        api.actions.loaded([
          'assets/butterfly.mp4',
          'https://flutter.github.io/assets-for-api-docs//assets/videos/bee.mp4',
          'https://flutter.github.io/assets-for-api-docs//assets/videos/not-found.mp4',
        ]);
      });
    }
  };
}
