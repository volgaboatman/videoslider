// GENERATED CODE - DO NOT MODIFY BY HAND

part of state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoControllerState> _$videoControllerStateSerializer =
    new _$VideoControllerStateSerializer();
Serializer<VideoSliderState> _$videoSliderStateSerializer =
    new _$VideoSliderStateSerializer();

class _$VideoControllerStateSerializer
    implements StructuredSerializer<VideoControllerState> {
  @override
  final Iterable<Type> types = const [
    VideoControllerState,
    _$VideoControllerState
  ];
  @override
  final String wireName = 'VideoControllerState';

  @override
  Iterable<Object> serialize(
      Serializers serializers, VideoControllerState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'position',
      serializers.serialize(object.position,
          specifiedType: const FullType(double)),
      'isPlaying',
      serializers.serialize(object.isPlaying,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  VideoControllerState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoControllerStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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
      'controllers',
      serializers.serialize(object.controllers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VideoControllerState)])),
      'isMuted',
      serializers.serialize(object.isMuted,
          specifiedType: const FullType(bool)),
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'initialVolume',
      serializers.serialize(object.initialVolume,
          specifiedType: const FullType(double)),
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
        case 'controllers':
          result.controllers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VideoControllerState)]))
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
        case 'initialVolume':
          result.initialVolume = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoControllerState extends VideoControllerState {
  @override
  final int id;
  @override
  final String url;
  @override
  final double position;
  @override
  final bool isPlaying;

  factory _$VideoControllerState(
          [void Function(VideoControllerStateBuilder) updates]) =>
      (new VideoControllerStateBuilder()..update(updates)).build();

  _$VideoControllerState._({this.id, this.url, this.position, this.isPlaying})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('VideoControllerState', 'id');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('VideoControllerState', 'url');
    }
    if (position == null) {
      throw new BuiltValueNullFieldError('VideoControllerState', 'position');
    }
    if (isPlaying == null) {
      throw new BuiltValueNullFieldError('VideoControllerState', 'isPlaying');
    }
  }

  @override
  VideoControllerState rebuild(
          void Function(VideoControllerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoControllerStateBuilder toBuilder() =>
      new VideoControllerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoControllerState &&
        id == other.id &&
        url == other.url &&
        position == other.position &&
        isPlaying == other.isPlaying;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), url.hashCode), position.hashCode),
        isPlaying.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoControllerState')
          ..add('id', id)
          ..add('url', url)
          ..add('position', position)
          ..add('isPlaying', isPlaying))
        .toString();
  }
}

class VideoControllerStateBuilder
    implements Builder<VideoControllerState, VideoControllerStateBuilder> {
  _$VideoControllerState _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  double _position;
  double get position => _$this._position;
  set position(double position) => _$this._position = position;

  bool _isPlaying;
  bool get isPlaying => _$this._isPlaying;
  set isPlaying(bool isPlaying) => _$this._isPlaying = isPlaying;

  VideoControllerStateBuilder();

  VideoControllerStateBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _url = _$v.url;
      _position = _$v.position;
      _isPlaying = _$v.isPlaying;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoControllerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VideoControllerState;
  }

  @override
  void update(void Function(VideoControllerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VideoControllerState build() {
    final _$result = _$v ??
        new _$VideoControllerState._(
            id: id, url: url, position: position, isPlaying: isPlaying);
    replace(_$result);
    return _$result;
  }
}

class _$VideoSliderState extends VideoSliderState {
  @override
  final int currentPage;
  @override
  final BuiltList<VideoControllerState> controllers;
  @override
  final bool isMuted;
  @override
  final bool isLoading;
  @override
  final double initialVolume;

  factory _$VideoSliderState(
          [void Function(VideoSliderStateBuilder) updates]) =>
      (new VideoSliderStateBuilder()..update(updates)).build();

  _$VideoSliderState._(
      {this.currentPage,
      this.controllers,
      this.isMuted,
      this.isLoading,
      this.initialVolume})
      : super._() {
    if (currentPage == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'currentPage');
    }
    if (controllers == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'controllers');
    }
    if (isMuted == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'isMuted');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'isLoading');
    }
    if (initialVolume == null) {
      throw new BuiltValueNullFieldError('VideoSliderState', 'initialVolume');
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
        controllers == other.controllers &&
        isMuted == other.isMuted &&
        isLoading == other.isLoading &&
        initialVolume == other.initialVolume;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, currentPage.hashCode), controllers.hashCode),
                isMuted.hashCode),
            isLoading.hashCode),
        initialVolume.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VideoSliderState')
          ..add('currentPage', currentPage)
          ..add('controllers', controllers)
          ..add('isMuted', isMuted)
          ..add('isLoading', isLoading)
          ..add('initialVolume', initialVolume))
        .toString();
  }
}

class VideoSliderStateBuilder
    implements Builder<VideoSliderState, VideoSliderStateBuilder> {
  _$VideoSliderState _$v;

  int _currentPage;
  int get currentPage => _$this._currentPage;
  set currentPage(int currentPage) => _$this._currentPage = currentPage;

  ListBuilder<VideoControllerState> _controllers;
  ListBuilder<VideoControllerState> get controllers =>
      _$this._controllers ??= new ListBuilder<VideoControllerState>();
  set controllers(ListBuilder<VideoControllerState> controllers) =>
      _$this._controllers = controllers;

  bool _isMuted;
  bool get isMuted => _$this._isMuted;
  set isMuted(bool isMuted) => _$this._isMuted = isMuted;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  double _initialVolume;
  double get initialVolume => _$this._initialVolume;
  set initialVolume(double initialVolume) =>
      _$this._initialVolume = initialVolume;

  VideoSliderStateBuilder();

  VideoSliderStateBuilder get _$this {
    if (_$v != null) {
      _currentPage = _$v.currentPage;
      _controllers = _$v.controllers?.toBuilder();
      _isMuted = _$v.isMuted;
      _isLoading = _$v.isLoading;
      _initialVolume = _$v.initialVolume;
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
              controllers: controllers.build(),
              isMuted: isMuted,
              isLoading: isLoading,
              initialVolume: initialVolume);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'controllers';
        controllers.build();
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
