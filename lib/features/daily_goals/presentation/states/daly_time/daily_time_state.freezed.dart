// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_time_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyTimeState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  Set<int> get selectedDaysIndexes => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyTimeStateCopyWith<DailyTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTimeStateCopyWith<$Res> {
  factory $DailyTimeStateCopyWith(
          DailyTimeState value, $Res Function(DailyTimeState) then) =
      _$DailyTimeStateCopyWithImpl<$Res, DailyTimeState>;
  @useResult
  $Res call(
      {bool isLoading,
      int hour,
      int minute,
      Set<int> selectedDaysIndexes,
      Option<Failure> failure});
}

/// @nodoc
class _$DailyTimeStateCopyWithImpl<$Res, $Val extends DailyTimeState>
    implements $DailyTimeStateCopyWith<$Res> {
  _$DailyTimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hour = null,
    Object? minute = null,
    Object? selectedDaysIndexes = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDaysIndexes: null == selectedDaysIndexes
          ? _value.selectedDaysIndexes
          : selectedDaysIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTimeStateImplCopyWith<$Res>
    implements $DailyTimeStateCopyWith<$Res> {
  factory _$$DailyTimeStateImplCopyWith(_$DailyTimeStateImpl value,
          $Res Function(_$DailyTimeStateImpl) then) =
      __$$DailyTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int hour,
      int minute,
      Set<int> selectedDaysIndexes,
      Option<Failure> failure});
}

/// @nodoc
class __$$DailyTimeStateImplCopyWithImpl<$Res>
    extends _$DailyTimeStateCopyWithImpl<$Res, _$DailyTimeStateImpl>
    implements _$$DailyTimeStateImplCopyWith<$Res> {
  __$$DailyTimeStateImplCopyWithImpl(
      _$DailyTimeStateImpl _value, $Res Function(_$DailyTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? hour = null,
    Object? minute = null,
    Object? selectedDaysIndexes = null,
    Object? failure = null,
  }) {
    return _then(_$DailyTimeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDaysIndexes: null == selectedDaysIndexes
          ? _value._selectedDaysIndexes
          : selectedDaysIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$DailyTimeStateImpl extends _DailyTimeState {
  _$DailyTimeStateImpl(
      {required this.isLoading,
      required this.hour,
      required this.minute,
      required final Set<int> selectedDaysIndexes,
      required this.failure})
      : _selectedDaysIndexes = selectedDaysIndexes,
        super._();

  @override
  final bool isLoading;
  @override
  final int hour;
  @override
  final int minute;
  final Set<int> _selectedDaysIndexes;
  @override
  Set<int> get selectedDaysIndexes {
    if (_selectedDaysIndexes is EqualUnmodifiableSetView)
      return _selectedDaysIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedDaysIndexes);
  }

  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'DailyTimeState(isLoading: $isLoading, hour: $hour, minute: $minute, selectedDaysIndexes: $selectedDaysIndexes, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTimeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            const DeepCollectionEquality()
                .equals(other._selectedDaysIndexes, _selectedDaysIndexes) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, hour, minute,
      const DeepCollectionEquality().hash(_selectedDaysIndexes), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTimeStateImplCopyWith<_$DailyTimeStateImpl> get copyWith =>
      __$$DailyTimeStateImplCopyWithImpl<_$DailyTimeStateImpl>(
          this, _$identity);
}

abstract class _DailyTimeState extends DailyTimeState {
  factory _DailyTimeState(
      {required final bool isLoading,
      required final int hour,
      required final int minute,
      required final Set<int> selectedDaysIndexes,
      required final Option<Failure> failure}) = _$DailyTimeStateImpl;
  _DailyTimeState._() : super._();

  @override
  bool get isLoading;
  @override
  int get hour;
  @override
  int get minute;
  @override
  Set<int> get selectedDaysIndexes;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$DailyTimeStateImplCopyWith<_$DailyTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
