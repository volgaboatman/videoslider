// GENERATED CODE - DO NOT MODIFY BY HAND

part of state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoSliderState> _$videoSliderStateSerializer =
    new _$VideoSliderStateSerializer();

class _$VideoSliderStateSerializer
    implements StructuredSerializer<VideoSliderState> {
  @override
  final Iterable<Type> types = const [VideoSliderState, _$VideoSliderState];
  @override
  final String wireName = 'VideoSliderState';

  @override
  Iterable<Object> serialize(Serializers serializers, VideoSliderState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentPage',
      serializers.serialize(object.currentPage,
          specifiedType: const FullType(int)),
      'videos',
      serializers.serialize(object.videos,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'isPlaying',
      serializers.serialize(object.isPlaying,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  VideoSliderState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoSliderStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentPage':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<dynamic>);
          break;
        case 'isMuted':
          result.isMuted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isPlaying':
          result.isPlaying = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoSliderState extends VideoSliderState {
  @override
  final int currentPage;
  @override
  final BuiltList<String> videos;
  @override
  final bool isMuted;
  @override
  final bool isLoading;
  @override
  final bool isPlaying;

  factory _$VideoSliderState(
          [void Function(VideoSliderStateBuilder) updates]) =>
      (new VideoSliderStateBuilder()..update(updates)).build();

  _$VideoSliderState._(
      {this.currentPage,
      this.videos,
      this.isMuted,
      this.isLoading,
      this.isPlaying})
      : super._() {
    if (currentPage == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'currentPage');
    }
    if (videos == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'videos');
    }
    if (isMuted == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'isMuted');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'isLoading');
    }
    if (isPlaying == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'isPlaying');
    }
  }

  @override
  VideoSliderState rebuild(void Function(VideoSliderStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoSliderStateBuilder toBuilder() =>
      new VideoSliderStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoSliderState &&
        currentPage == other.currentPage &&
        videos == other.videos &&
        isMuted == other.isMuted &&
        isLoading == other.isLoading &&
        isPlaying == other.isPlaying;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, currentPage.hashCode), videos.hashCode),
                isMuted.hashCode),
            isLoading.hashCode),
        isPlaying.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSliderState')
          ..add('currentPage', currentPage)
          ..add('videos', videos)
          ..add('isMuted', isMuted)
          ..add('isLoading', isLoading)
          ..add('isPlaying', isPlaying))
        .toString();
  }
}

class VideoSliderStateBuilder
    implements Builder<VideoSliderState, VideoSliderStateBuilder> {
  _$VideoSliderState _$v;

  int _currentPage;
  int get currentPage => _$this._currentPage;
  set currentPage(int currentPage) => _$this._currentPage = currentPage;

  ListBuilder<String> _videos;
  ListBuilder<String> get videos =>
      _$this._videos ??= new ListBuilder<String>();
  set videos(ListBuilder<String> videos) => _$this._videos = videos;

  bool _isMuted;
  bool get isMuted => _$this._isMuted;
  set isMuted(bool isMuted) => _$this._isMuted = isMuted;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isPlaying;
  bool get isPlaying => _$this._isPlaying;
  set isPlaying(bool isPlaying) => _$this._isPlaying = isPlaying;

  VideoSliderStateBuilder();

  VideoSliderStateBuilder get _$this {
    if (_$v != null) {
      _currentPage = _$v.currentPage;
      _videos = _$v.videos?.toBuilder();
      _isMuted = _$v.isMuted;
      _isLoading = _$v.isLoading;
      _isPlaying = _$v.isPlaying;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoSliderState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoSliderState;
  }

  @override
  void update(void Function(VideoSliderStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoSliderState build() {
    _$VideoSliderState _$result;
    try {
      _$result = _$v ??
          new _$VideoSliderState._(
              currentPage: currentPage,
              videos: videos.build(),
              isMuted: isMuted,
              isLoading: isLoading,
              isPlaying: isPlaying);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videos';
        videos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VideoSliderState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
