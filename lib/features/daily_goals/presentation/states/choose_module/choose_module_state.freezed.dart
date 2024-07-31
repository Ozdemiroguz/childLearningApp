// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_module_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChooseModuleState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isModuleOpen => throw _privateConstructorUsedError;
  List<String> get modules => throw _privateConstructorUsedError;
  String get selectedModule => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChooseModuleStateCopyWith<ChooseModuleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseModuleStateCopyWith<$Res> {
  factory $ChooseModuleStateCopyWith(
          ChooseModuleState value, $Res Function(ChooseModuleState) then) =
      _$ChooseModuleStateCopyWithImpl<$Res, ChooseModuleState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isModuleOpen,
      List<String> modules,
      String selectedModule,
      Option<Failure> failure});
}

/// @nodoc
class _$ChooseModuleStateCopyWithImpl<$Res, $Val extends ChooseModuleState>
    implements $ChooseModuleStateCopyWith<$Res> {
  _$ChooseModuleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isModuleOpen = null,
    Object? modules = null,
    Object? selectedModule = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isModuleOpen: null == isModuleOpen
          ? _value.isModuleOpen
          : isModuleOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedModule: null == selectedModule
          ? _value.selectedModule
          : selectedModule // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChooseModuleStateImplCopyWith<$Res>
    implements $ChooseModuleStateCopyWith<$Res> {
  factory _$$ChooseModuleStateImplCopyWith(_$ChooseModuleStateImpl value,
          $Res Function(_$ChooseModuleStateImpl) then) =
      __$$ChooseModuleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isModuleOpen,
      List<String> modules,
      String selectedModule,
      Option<Failure> failure});
}

/// @nodoc
class __$$ChooseModuleStateImplCopyWithImpl<$Res>
    extends _$ChooseModuleStateCopyWithImpl<$Res, _$ChooseModuleStateImpl>
    implements _$$ChooseModuleStateImplCopyWith<$Res> {
  __$$ChooseModuleStateImplCopyWithImpl(_$ChooseModuleStateImpl _value,
      $Res Function(_$ChooseModuleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isModuleOpen = null,
    Object? modules = null,
    Object? selectedModule = null,
    Object? failure = null,
  }) {
    return _then(_$ChooseModuleStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isModuleOpen: null == isModuleOpen
          ? _value.isModuleOpen
          : isModuleOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedModule: null == selectedModule
          ? _value.selectedModule
          : selectedModule // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$ChooseModuleStateImpl extends _ChooseModuleState {
  _$ChooseModuleStateImpl(
      {required this.isLoading,
      required this.isModuleOpen,
      required final List<String> modules,
      required this.selectedModule,
      required this.failure})
      : _modules = modules,
        super._();

  @override
  final bool isLoading;
  @override
  final bool isModuleOpen;
  final List<String> _modules;
  @override
  List<String> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  @override
  final String selectedModule;
  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'ChooseModuleState(isLoading: $isLoading, isModuleOpen: $isModuleOpen, modules: $modules, selectedModule: $selectedModule, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseModuleStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isModuleOpen, isModuleOpen) ||
                other.isModuleOpen == isModuleOpen) &&
            const DeepCollectionEquality().equals(other._modules, _modules) &&
            (identical(other.selectedModule, selectedModule) ||
                other.selectedModule == selectedModule) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isModuleOpen,
      const DeepCollectionEquality().hash(_modules), selectedModule, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseModuleStateImplCopyWith<_$ChooseModuleStateImpl> get copyWith =>
      __$$ChooseModuleStateImplCopyWithImpl<_$ChooseModuleStateImpl>(
          this, _$identity);
}

abstract class _ChooseModuleState extends ChooseModuleState {
  factory _ChooseModuleState(
      {required final bool isLoading,
      required final bool isModuleOpen,
      required final List<String> modules,
      required final String selectedModule,
      required final Option<Failure> failure}) = _$ChooseModuleStateImpl;
  _ChooseModuleState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isModuleOpen;
  @override
  List<String> get modules;
  @override
  String get selectedModule;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$ChooseModuleStateImplCopyWith<_$ChooseModuleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
