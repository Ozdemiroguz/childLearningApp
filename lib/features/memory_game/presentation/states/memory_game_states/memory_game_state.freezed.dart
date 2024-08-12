// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemoryGameState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get cardNumber => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  List<MemoryGameModel> get memoryGameModels =>
      throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoryGameStateCopyWith<MemoryGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryGameStateCopyWith<$Res> {
  factory $MemoryGameStateCopyWith(
          MemoryGameState value, $Res Function(MemoryGameState) then) =
      _$MemoryGameStateCopyWithImpl<$Res, MemoryGameState>;
  @useResult
  $Res call(
      {bool isLoading,
      int cardNumber,
      int level,
      List<MemoryGameModel> memoryGameModels,
      Option<Failure> failure});
}

/// @nodoc
class _$MemoryGameStateCopyWithImpl<$Res, $Val extends MemoryGameState>
    implements $MemoryGameStateCopyWith<$Res> {
  _$MemoryGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cardNumber = null,
    Object? level = null,
    Object? memoryGameModels = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      memoryGameModels: null == memoryGameModels
          ? _value.memoryGameModels
          : memoryGameModels // ignore: cast_nullable_to_non_nullable
              as List<MemoryGameModel>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoryGameStateImplCopyWith<$Res>
    implements $MemoryGameStateCopyWith<$Res> {
  factory _$$MemoryGameStateImplCopyWith(_$MemoryGameStateImpl value,
          $Res Function(_$MemoryGameStateImpl) then) =
      __$$MemoryGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int cardNumber,
      int level,
      List<MemoryGameModel> memoryGameModels,
      Option<Failure> failure});
}

/// @nodoc
class __$$MemoryGameStateImplCopyWithImpl<$Res>
    extends _$MemoryGameStateCopyWithImpl<$Res, _$MemoryGameStateImpl>
    implements _$$MemoryGameStateImplCopyWith<$Res> {
  __$$MemoryGameStateImplCopyWithImpl(
      _$MemoryGameStateImpl _value, $Res Function(_$MemoryGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? cardNumber = null,
    Object? level = null,
    Object? memoryGameModels = null,
    Object? failure = null,
  }) {
    return _then(_$MemoryGameStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      memoryGameModels: null == memoryGameModels
          ? _value._memoryGameModels
          : memoryGameModels // ignore: cast_nullable_to_non_nullable
              as List<MemoryGameModel>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$MemoryGameStateImpl extends _MemoryGameState {
  _$MemoryGameStateImpl(
      {required this.isLoading,
      required this.cardNumber,
      required this.level,
      required final List<MemoryGameModel> memoryGameModels,
      required this.failure})
      : _memoryGameModels = memoryGameModels,
        super._();

  @override
  final bool isLoading;
  @override
  final int cardNumber;
  @override
  final int level;
  final List<MemoryGameModel> _memoryGameModels;
  @override
  List<MemoryGameModel> get memoryGameModels {
    if (_memoryGameModels is EqualUnmodifiableListView)
      return _memoryGameModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memoryGameModels);
  }

  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'MemoryGameState(isLoading: $isLoading, cardNumber: $cardNumber, level: $level, memoryGameModels: $memoryGameModels, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoryGameStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality()
                .equals(other._memoryGameModels, _memoryGameModels) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, cardNumber, level,
      const DeepCollectionEquality().hash(_memoryGameModels), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoryGameStateImplCopyWith<_$MemoryGameStateImpl> get copyWith =>
      __$$MemoryGameStateImplCopyWithImpl<_$MemoryGameStateImpl>(
          this, _$identity);
}

abstract class _MemoryGameState extends MemoryGameState {
  factory _MemoryGameState(
      {required final bool isLoading,
      required final int cardNumber,
      required final int level,
      required final List<MemoryGameModel> memoryGameModels,
      required final Option<Failure> failure}) = _$MemoryGameStateImpl;
  _MemoryGameState._() : super._();

  @override
  bool get isLoading;
  @override
  int get cardNumber;
  @override
  int get level;
  @override
  List<MemoryGameModel> get memoryGameModels;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$MemoryGameStateImplCopyWith<_$MemoryGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
