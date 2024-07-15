// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crossword_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrossWordState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  WordData get wordData => throw _privateConstructorUsedError;
  List<String> get wordsToFind => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  bool get sectionCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CrossWordStateCopyWith<CrossWordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrossWordStateCopyWith<$Res> {
  factory $CrossWordStateCopyWith(
          CrossWordState value, $Res Function(CrossWordState) then) =
      _$CrossWordStateCopyWithImpl<$Res, CrossWordState>;
  @useResult
  $Res call(
      {bool isLoading,
      int time,
      WordData wordData,
      List<String> wordsToFind,
      Color color,
      bool sectionCompleted});
}

/// @nodoc
class _$CrossWordStateCopyWithImpl<$Res, $Val extends CrossWordState>
    implements $CrossWordStateCopyWith<$Res> {
  _$CrossWordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? time = null,
    Object? wordData = null,
    Object? wordsToFind = null,
    Object? color = null,
    Object? sectionCompleted = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      wordData: null == wordData
          ? _value.wordData
          : wordData // ignore: cast_nullable_to_non_nullable
              as WordData,
      wordsToFind: null == wordsToFind
          ? _value.wordsToFind
          : wordsToFind // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      sectionCompleted: null == sectionCompleted
          ? _value.sectionCompleted
          : sectionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrossWordStateImplCopyWith<$Res>
    implements $CrossWordStateCopyWith<$Res> {
  factory _$$CrossWordStateImplCopyWith(_$CrossWordStateImpl value,
          $Res Function(_$CrossWordStateImpl) then) =
      __$$CrossWordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int time,
      WordData wordData,
      List<String> wordsToFind,
      Color color,
      bool sectionCompleted});
}

/// @nodoc
class __$$CrossWordStateImplCopyWithImpl<$Res>
    extends _$CrossWordStateCopyWithImpl<$Res, _$CrossWordStateImpl>
    implements _$$CrossWordStateImplCopyWith<$Res> {
  __$$CrossWordStateImplCopyWithImpl(
      _$CrossWordStateImpl _value, $Res Function(_$CrossWordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? time = null,
    Object? wordData = null,
    Object? wordsToFind = null,
    Object? color = null,
    Object? sectionCompleted = null,
  }) {
    return _then(_$CrossWordStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      wordData: null == wordData
          ? _value.wordData
          : wordData // ignore: cast_nullable_to_non_nullable
              as WordData,
      wordsToFind: null == wordsToFind
          ? _value._wordsToFind
          : wordsToFind // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      sectionCompleted: null == sectionCompleted
          ? _value.sectionCompleted
          : sectionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CrossWordStateImpl extends _CrossWordState {
  _$CrossWordStateImpl(
      {required this.isLoading,
      required this.time,
      required this.wordData,
      required final List<String> wordsToFind,
      required this.color,
      required this.sectionCompleted})
      : _wordsToFind = wordsToFind,
        super._();

  @override
  final bool isLoading;
  @override
  final int time;
  @override
  final WordData wordData;
  final List<String> _wordsToFind;
  @override
  List<String> get wordsToFind {
    if (_wordsToFind is EqualUnmodifiableListView) return _wordsToFind;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordsToFind);
  }

  @override
  final Color color;
  @override
  final bool sectionCompleted;

  @override
  String toString() {
    return 'CrossWordState(isLoading: $isLoading, time: $time, wordData: $wordData, wordsToFind: $wordsToFind, color: $color, sectionCompleted: $sectionCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrossWordStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.wordData, wordData) ||
                other.wordData == wordData) &&
            const DeepCollectionEquality()
                .equals(other._wordsToFind, _wordsToFind) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.sectionCompleted, sectionCompleted) ||
                other.sectionCompleted == sectionCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      time,
      wordData,
      const DeepCollectionEquality().hash(_wordsToFind),
      color,
      sectionCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrossWordStateImplCopyWith<_$CrossWordStateImpl> get copyWith =>
      __$$CrossWordStateImplCopyWithImpl<_$CrossWordStateImpl>(
          this, _$identity);
}

abstract class _CrossWordState extends CrossWordState {
  factory _CrossWordState(
      {required final bool isLoading,
      required final int time,
      required final WordData wordData,
      required final List<String> wordsToFind,
      required final Color color,
      required final bool sectionCompleted}) = _$CrossWordStateImpl;
  _CrossWordState._() : super._();

  @override
  bool get isLoading;
  @override
  int get time;
  @override
  WordData get wordData;
  @override
  List<String> get wordsToFind;
  @override
  Color get color;
  @override
  bool get sectionCompleted;
  @override
  @JsonKey(ignore: true)
  _$$CrossWordStateImplCopyWith<_$CrossWordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
