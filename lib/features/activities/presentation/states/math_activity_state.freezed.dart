// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'math_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MathActivityState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<int> get answers => throw _privateConstructorUsedError;
  List<int> get options => throw _privateConstructorUsedError;
  int get currentQuestion => throw _privateConstructorUsedError;
  int get random => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MathActivityStateCopyWith<MathActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MathActivityStateCopyWith<$Res> {
  factory $MathActivityStateCopyWith(
          MathActivityState value, $Res Function(MathActivityState) then) =
      _$MathActivityStateCopyWithImpl<$Res, MathActivityState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<int> answers,
      List<int> options,
      int currentQuestion,
      int random});
}

/// @nodoc
class _$MathActivityStateCopyWithImpl<$Res, $Val extends MathActivityState>
    implements $MathActivityStateCopyWith<$Res> {
  _$MathActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? answers = null,
    Object? options = null,
    Object? currentQuestion = null,
    Object? random = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      random: null == random
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MathActivityStateImplCopyWith<$Res>
    implements $MathActivityStateCopyWith<$Res> {
  factory _$$MathActivityStateImplCopyWith(_$MathActivityStateImpl value,
          $Res Function(_$MathActivityStateImpl) then) =
      __$$MathActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<int> answers,
      List<int> options,
      int currentQuestion,
      int random});
}

/// @nodoc
class __$$MathActivityStateImplCopyWithImpl<$Res>
    extends _$MathActivityStateCopyWithImpl<$Res, _$MathActivityStateImpl>
    implements _$$MathActivityStateImplCopyWith<$Res> {
  __$$MathActivityStateImplCopyWithImpl(_$MathActivityStateImpl _value,
      $Res Function(_$MathActivityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? answers = null,
    Object? options = null,
    Object? currentQuestion = null,
    Object? random = null,
  }) {
    return _then(_$MathActivityStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      random: null == random
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MathActivityStateImpl extends _MathActivityState {
  _$MathActivityStateImpl(
      {required this.isLoading,
      required final List<int> answers,
      required final List<int> options,
      required this.currentQuestion,
      required this.random})
      : _answers = answers,
        _options = options,
        super._();

  @override
  final bool isLoading;
  final List<int> _answers;
  @override
  List<int> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<int> _options;
  @override
  List<int> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int currentQuestion;
  @override
  final int random;

  @override
  String toString() {
    return 'MathActivityState(isLoading: $isLoading, answers: $answers, options: $options, currentQuestion: $currentQuestion, random: $random)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MathActivityStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.currentQuestion, currentQuestion) ||
                other.currentQuestion == currentQuestion) &&
            (identical(other.random, random) || other.random == random));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_options),
      currentQuestion,
      random);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MathActivityStateImplCopyWith<_$MathActivityStateImpl> get copyWith =>
      __$$MathActivityStateImplCopyWithImpl<_$MathActivityStateImpl>(
          this, _$identity);
}

abstract class _MathActivityState extends MathActivityState {
  factory _MathActivityState(
      {required final bool isLoading,
      required final List<int> answers,
      required final List<int> options,
      required final int currentQuestion,
      required final int random}) = _$MathActivityStateImpl;
  _MathActivityState._() : super._();

  @override
  bool get isLoading;
  @override
  List<int> get answers;
  @override
  List<int> get options;
  @override
  int get currentQuestion;
  @override
  int get random;
  @override
  @JsonKey(ignore: true)
  _$$MathActivityStateImplCopyWith<_$MathActivityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
