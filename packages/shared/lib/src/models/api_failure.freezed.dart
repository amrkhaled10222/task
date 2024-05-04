// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-model');

ApiResponseFailureModel _$ApiResponseFailureModelFromJson(
    Map<String, dynamic> json) {
  return _ApiResponseFailureModel.fromJson(json);
}

/// @nodoc
mixin _$ApiResponseFailureModel {
  List<ApiFailureMessage>? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseFailureModelCopyWith<ApiResponseFailureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseFailureModelCopyWith<$Res> {
  factory $ApiResponseFailureModelCopyWith(ApiResponseFailureModel value,
          $Res Function(ApiResponseFailureModel) then) =
      _$ApiResponseFailureModelCopyWithImpl<$Res, ApiResponseFailureModel>;
  @useResult
  $Res call({List<ApiFailureMessage>? errors});
}

/// @nodoc
class _$ApiResponseFailureModelCopyWithImpl<$Res,
        $Val extends ApiResponseFailureModel>
    implements $ApiResponseFailureModelCopyWith<$Res> {
  _$ApiResponseFailureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiFailureMessage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseFailureModelImplCopyWith<$Res>
    implements $ApiResponseFailureModelCopyWith<$Res> {
  factory _$$ApiResponseFailureModelImplCopyWith(
          _$ApiResponseFailureModelImpl value,
          $Res Function(_$ApiResponseFailureModelImpl) then) =
      __$$ApiResponseFailureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApiFailureMessage>? errors});
}

/// @nodoc
class __$$ApiResponseFailureModelImplCopyWithImpl<$Res>
    extends _$ApiResponseFailureModelCopyWithImpl<$Res,
        _$ApiResponseFailureModelImpl>
    implements _$$ApiResponseFailureModelImplCopyWith<$Res> {
  __$$ApiResponseFailureModelImplCopyWithImpl(
      _$ApiResponseFailureModelImpl _value,
      $Res Function(_$ApiResponseFailureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
  }) {
    return _then(_$ApiResponseFailureModelImpl(
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiFailureMessage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseFailureModelImpl implements _ApiResponseFailureModel {
  _$ApiResponseFailureModelImpl({final List<ApiFailureMessage>? errors})
      : _errors = errors;

  factory _$ApiResponseFailureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseFailureModelImplFromJson(json);

  final List<ApiFailureMessage>? _errors;
  @override
  List<ApiFailureMessage>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ApiResponseFailureModel(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseFailureModelImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseFailureModelImplCopyWith<_$ApiResponseFailureModelImpl>
      get copyWith => __$$ApiResponseFailureModelImplCopyWithImpl<
          _$ApiResponseFailureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseFailureModelImplToJson(
      this,
    );
  }
}

abstract class _ApiResponseFailureModel implements ApiResponseFailureModel {
  factory _ApiResponseFailureModel({final List<ApiFailureMessage>? errors}) =
      _$ApiResponseFailureModelImpl;

  factory _ApiResponseFailureModel.fromJson(Map<String, dynamic> json) =
      _$ApiResponseFailureModelImpl.fromJson;

  @override
  List<ApiFailureMessage>? get errors;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseFailureModelImplCopyWith<_$ApiResponseFailureModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
