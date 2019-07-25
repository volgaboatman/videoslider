import 'package:built_redux/built_redux.dart';
import 'package:test/test.dart';
import 'package:videoslider/store/actions.dart';
import 'package:videoslider/store/middleware.dart';
import 'package:videoslider/store/reducers.dart';
import 'package:videoslider/store/state.dart';

class _TestStore extends Store<VideoSliderState, VideoSliderStateBuilder,
    VideoSliderActions> {
  _TestStore()
      : super(
          reducerBuilder.build(),
          new VideoSliderState(),
          new VideoSliderActions(),
          middleware: [
            createVideoListMiddleware(),
          ],
        );

  _TestStore load() {
    this.actions.loaded(['1', '2', '3']);
    return this;
  }

  _TestStore setPage(int pageIdx) {
    this.actions.setPage(pageIdx);
    return this;
  }

  _TestStore setIsMuted(bool muted) {
    this.actions.setIsMuted(muted);
    return this;
  }
}

main() {
  group('Store test', () {
    test('isLoading on start', () {
      final store = new _TestStore();
      expect(store.state.isLoading, true);
    });

    test('should load videos', () {
      final store = new _TestStore().load();

      expect(store.state.isLoading, false);
      expect(store.state.controllers.length, 3);
      expect(store.state.controllers[0].isPlaying, true);
    });

    test('should start playing', () {
      final store = new _TestStore().load().setPage(2);

      expect(store.state.controllers.length, 3);
      expect(store.state.controllers[0].isPlaying, false);
      expect(store.state.controllers[2].isPlaying, true);
    });

    test('should be muted or not', () {
      final store = new _TestStore().load().setIsMuted(true);

      expect(store.state.volume, 0);
      store.setIsMuted(false);
      expect(store.state.volume > 0, true);
    });
  });
}
