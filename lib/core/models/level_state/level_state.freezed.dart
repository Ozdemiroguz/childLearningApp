// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LevelState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LevelStateCopyWith<LevelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelStateCopyWith<$Res> {
  factory $LevelStateCopyWith(
          LevelState value, $Res Function(LevelState) then) =
      _$LevelStateCopyWithImpl<$Res, LevelState>;
  @useResult
  $Res call({bool isLoading, int level, Option<Failure> failure});
}

/// @nodoc
class _$LevelStateCopyWithImpl<$Res, $Val extends LevelState>
    implements $LevelStateCopyWith<$Res> {
  _$LevelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? level = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LevelStateImplCopyWith<$Res>
    implements $LevelStateCopyWith<$Res> {
  factory _$$LevelStateImplCopyWith(
          _$LevelStateImpl value, $Res Function(_$LevelStateImpl) then) =
      __$$LevelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, int level, Option<Failure> failure});
}

/// @nodoc
class __$$LevelStateImplCopyWithImpl<$Res>
    extends _$LevelStateCopyWithImpl<$Res, _$LevelStateImpl>
    implements _$$LevelStateImplCopyWith<$Res> {
  __$$LevelStateImplCopyWithImpl(
      _$LevelStateImpl _value, $Res Function(_$LevelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? level = null,
    Object? failure = null,
  }) {
    return _then(_$LevelStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$LevelStateImpl extends _LevelState {
  _$LevelStateImpl(
      {required this.isLoading, required this.level, required this.failure})
      : super._();

  @override
  final bool isLoading;
  @override
  final int level;
  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'LevelState(isLoading: $isLoading, level: $level, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LevelStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, level, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LevelStateImplCopyWith<_$LevelStateImpl> get copyWith =>
      __$$LevelStateImplCopyWithImpl<_$LevelStateImpl>(this, _$identity);
}

abstract class _LevelState extends LevelState {
  factory _LevelState(
      {required final bool isLoading,
      required final int level,
      required final Option<Failure> failure}) = _$LevelStateImpl;
  _LevelState._() : super._();

  @override
  bool get isLoading;
  @override
  int get level;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$LevelStateImplCopyWith<_$LevelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
