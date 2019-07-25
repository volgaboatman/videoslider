// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:built_redux/built_redux.dart';

import 'actions.dart';
import 'state.dart';

Middleware<VideoSliderState, VideoSliderStateBuilder, VideoSliderActions>
    createVideoListMiddleware() {
  return (MiddlewareBuilder<VideoSliderState, VideoSliderStateBuilder,
          VideoSliderActions>()
        ..add(VideoSliderActionsNames.fetchVideoList, doFetchVideoList()))
      .build();
}

MiddlewareHandler<VideoSliderState, VideoSliderStateBuilder, VideoSliderActions,
    void> doFetchVideoList() {
  return (MiddlewareApi<VideoSliderState, VideoSliderStateBuilder,
              VideoSliderActions>
          api,
      ActionHandler next,
      Action<void> action) {
    next(action);

    if (api.state.isLoading) {
      new Timer(Duration(seconds: 5), () {
        api.actions.loaded([
          'assets/butterfly.mp4',
          'https://flutter.github.io/assets-for-api-docs//assets/videos/bee.mp4',
          'https://flutter.github.io/assets-for-api-docs//assets/videos/not-found.mp4',
        ]);
      });
    }
  };
}
