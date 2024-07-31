// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_skills_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChooseSkillsState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String get selectedSkills => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChooseSkillsStateCopyWith<ChooseSkillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseSkillsStateCopyWith<$Res> {
  factory $ChooseSkillsStateCopyWith(
          ChooseSkillsState value, $Res Function(ChooseSkillsState) then) =
      _$ChooseSkillsStateCopyWithImpl<$Res, ChooseSkillsState>;
  @useResult
  $Res call(
      {bool isLoading,
      String module,
      List<String> skills,
      String selectedSkills,
      Option<Failure> failure});
}

/// @nodoc
class _$ChooseSkillsStateCopyWithImpl<$Res, $Val extends ChooseSkillsState>
    implements $ChooseSkillsStateCopyWith<$Res> {
  _$ChooseSkillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? module = null,
    Object? skills = null,
    Object? selectedSkills = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSkills: null == selectedSkills
          ? _value.selectedSkills
          : selectedSkills // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChooseSkillsStateImplCopyWith<$Res>
    implements $ChooseSkillsStateCopyWith<$Res> {
  factory _$$ChooseSkillsStateImplCopyWith(_$ChooseSkillsStateImpl value,
          $Res Function(_$ChooseSkillsStateImpl) then) =
      __$$ChooseSkillsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String module,
      List<String> skills,
      String selectedSkills,
      Option<Failure> failure});
}

/// @nodoc
class __$$ChooseSkillsStateImplCopyWithImpl<$Res>
    extends _$ChooseSkillsStateCopyWithImpl<$Res, _$ChooseSkillsStateImpl>
    implements _$$ChooseSkillsStateImplCopyWith<$Res> {
  __$$ChooseSkillsStateImplCopyWithImpl(_$ChooseSkillsStateImpl _value,
      $Res Function(_$ChooseSkillsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? module = null,
    Object? skills = null,
    Object? selectedSkills = null,
    Object? failure = null,
  }) {
    return _then(_$ChooseSkillsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedSkills: null == selectedSkills
          ? _value.selectedSkills
          : selectedSkills // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$ChooseSkillsStateImpl extends _ChooseSkillsState {
  _$ChooseSkillsStateImpl(
      {required this.isLoading,
      required this.module,
      required final List<String> skills,
      required this.selectedSkills,
      required this.failure})
      : _skills = skills,
        super._();

  @override
  final bool isLoading;
  @override
  final String module;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final String selectedSkills;
  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'ChooseSkillsState(isLoading: $isLoading, module: $module, skills: $skills, selectedSkills: $selectedSkills, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseSkillsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.module, module) || other.module == module) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.selectedSkills, selectedSkills) ||
                other.selectedSkills == selectedSkills) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, module,
      const DeepCollectionEquality().hash(_skills), selectedSkills, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseSkillsStateImplCopyWith<_$ChooseSkillsStateImpl> get copyWith =>
      __$$ChooseSkillsStateImplCopyWithImpl<_$ChooseSkillsStateImpl>(
          this, _$identity);
}

abstract class _ChooseSkillsState extends ChooseSkillsState {
  factory _ChooseSkillsState(
      {required final bool isLoading,
      required final String module,
      required final List<String> skills,
      required final String selectedSkills,
      required final Option<Failure> failure}) = _$ChooseSkillsStateImpl;
  _ChooseSkillsState._() : super._();

  @override
  bool get isLoading;
  @override
  String get module;
  @override
  List<String> get skills;
  @override
  String get selectedSkills;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$ChooseSkillsStateImplCopyWith<_$ChooseSkillsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
