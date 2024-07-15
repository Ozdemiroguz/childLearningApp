// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LanguageActivityState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get currentQuestion => throw _privateConstructorUsedError;
  int? get selectedOption => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;
  int get random => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageActivityStateCopyWith<LanguageActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageActivityStateCopyWith<$Res> {
  factory $LanguageActivityStateCopyWith(LanguageActivityState value,
          $Res Function(LanguageActivityState) then) =
      _$LanguageActivityStateCopyWithImpl<$Res, LanguageActivityState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<String> answers,
      List<String> options,
      int currentQuestion,
      int? selectedOption,
      bool isCorrect,
      bool isAnswered,
      int random});
}

/// @nodoc
class _$LanguageActivityStateCopyWithImpl<$Res,
        $Val extends LanguageActivityState>
    implements $LanguageActivityStateCopyWith<$Res> {
  _$LanguageActivityStateCopyWithImpl(this._value, this._then);

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
    Object? selectedOption = freezed,
    Object? isCorrect = null,
    Object? isAnswered = null,
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
              as List<String>,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOption: freezed == selectedOption
          ? _value.selectedOption
          : selectedOption // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      random: null == random
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageActivityStateImplCopyWith<$Res>
    implements $LanguageActivityStateCopyWith<$Res> {
  factory _$$LanguageActivityStateImplCopyWith(
          _$LanguageActivityStateImpl value,
          $Res Function(_$LanguageActivityStateImpl) then) =
      __$$LanguageActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<String> answers,
      List<String> options,
      int currentQuestion,
      int? selectedOption,
      bool isCorrect,
      bool isAnswered,
      int random});
}

/// @nodoc
class __$$LanguageActivityStateImplCopyWithImpl<$Res>
    extends _$LanguageActivityStateCopyWithImpl<$Res,
        _$LanguageActivityStateImpl>
    implements _$$LanguageActivityStateImplCopyWith<$Res> {
  __$$LanguageActivityStateImplCopyWithImpl(_$LanguageActivityStateImpl _value,
      $Res Function(_$LanguageActivityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? answers = null,
    Object? options = null,
    Object? currentQuestion = null,
    Object? selectedOption = freezed,
    Object? isCorrect = null,
    Object? isAnswered = null,
    Object? random = null,
  }) {
    return _then(_$LanguageActivityStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOption: freezed == selectedOption
          ? _value.selectedOption
          : selectedOption // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      random: null == random
          ? _value.random
          : random // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LanguageActivityStateImpl extends _LanguageActivityState {
  _$LanguageActivityStateImpl(
      {required this.isLoading,
      required final List<String> answers,
      required final List<String> options,
      required this.currentQuestion,
      required this.selectedOption,
      required this.isCorrect,
      required this.isAnswered,
      required this.random})
      : _answers = answers,
        _options = options,
        super._();

  @override
  final bool isLoading;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int currentQuestion;
  @override
  final int? selectedOption;
  @override
  final bool isCorrect;
  @override
  final bool isAnswered;
  @override
  final int random;

  @override
  String toString() {
    return 'LanguageActivityState(isLoading: $isLoading, answers: $answers, options: $options, currentQuestion: $currentQuestion, selectedOption: $selectedOption, isCorrect: $isCorrect, isAnswered: $isAnswered, random: $random)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageActivityStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.currentQuestion, currentQuestion) ||
                other.currentQuestion == currentQuestion) &&
            (identical(other.selectedOption, selectedOption) ||
                other.selectedOption == selectedOption) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered) &&
            (identical(other.random, random) || other.random == random));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_options),
      currentQuestion,
      selectedOption,
      isCorrect,
      isAnswered,
      random);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageActivityStateImplCopyWith<_$LanguageActivityStateImpl>
      get copyWith => __$$LanguageActivityStateImplCopyWithImpl<
          _$LanguageActivityStateImpl>(this, _$identity);
}

abstract class _LanguageActivityState extends LanguageActivityState {
  factory _LanguageActivityState(
      {required final bool isLoading,
      required final List<String> answers,
      required final List<String> options,
      required final int currentQuestion,
      required final int? selectedOption,
      required final bool isCorrect,
      required final bool isAnswered,
      required final int random}) = _$LanguageActivityStateImpl;
  _LanguageActivityState._() : super._();

  @override
  bool get isLoading;
  @override
  List<String> get answers;
  @override
  List<String> get options;
  @override
  int get currentQuestion;
  @override
  int? get selectedOption;
  @override
  bool get isCorrect;
  @override
  bool get isAnswered;
  @override
  int get random;
  @override
  @JsonKey(ignore: true)
  _$$LanguageActivityStateImplCopyWith<_$LanguageActivityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
