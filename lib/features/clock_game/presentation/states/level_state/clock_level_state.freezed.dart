// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_level_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClockLevelState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClockLevelStateCopyWith<ClockLevelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockLevelStateCopyWith<$Res> {
  factory $ClockLevelStateCopyWith(
          ClockLevelState value, $Res Function(ClockLevelState) then) =
      _$ClockLevelStateCopyWithImpl<$Res, ClockLevelState>;
  @useResult
  $Res call({bool isLoading, int level, Option<Failure> failure});
}

/// @nodoc
class _$ClockLevelStateCopyWithImpl<$Res, $Val extends ClockLevelState>
    implements $ClockLevelStateCopyWith<$Res> {
  _$ClockLevelStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ClockLevelStateImplCopyWith<$Res>
    implements $ClockLevelStateCopyWith<$Res> {
  factory _$$ClockLevelStateImplCopyWith(_$ClockLevelStateImpl value,
          $Res Function(_$ClockLevelStateImpl) then) =
      __$$ClockLevelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, int level, Option<Failure> failure});
}

/// @nodoc
class __$$ClockLevelStateImplCopyWithImpl<$Res>
    extends _$ClockLevelStateCopyWithImpl<$Res, _$ClockLevelStateImpl>
    implements _$$ClockLevelStateImplCopyWith<$Res> {
  __$$ClockLevelStateImplCopyWithImpl(
      _$ClockLevelStateImpl _value, $Res Function(_$ClockLevelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? level = null,
    Object? failure = null,
  }) {
    return _then(_$ClockLevelStateImpl(
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

class _$ClockLevelStateImpl extends _ClockLevelState {
  _$ClockLevelStateImpl(
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
    return 'ClockLevelState(isLoading: $isLoading, level: $level, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClockLevelStateImpl &&
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
  _$$ClockLevelStateImplCopyWith<_$ClockLevelStateImpl> get copyWith =>
      __$$ClockLevelStateImplCopyWithImpl<_$ClockLevelStateImpl>(
          this, _$identity);
}

abstract class _ClockLevelState extends ClockLevelState {
  factory _ClockLevelState(
      {required final bool isLoading,
      required final int level,
      required final Option<Failure> failure}) = _$ClockLevelStateImpl;
  _ClockLevelState._() : super._();

  @override
  bool get isLoading;
  @override
  int get level;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$ClockLevelStateImplCopyWith<_$ClockLevelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
