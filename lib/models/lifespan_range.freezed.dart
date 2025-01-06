// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifespan_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LifespanRange _$LifespanRangeFromJson(Map<String, dynamic> json) {
  return _LifespanRange.fromJson(json);
}

/// @nodoc
mixin _$LifespanRange {
  DateTime get birthDate => throw _privateConstructorUsedError;
  DateTime get deathDate => throw _privateConstructorUsedError;

  /// Serializes this LifespanRange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LifespanRangeCopyWith<LifespanRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifespanRangeCopyWith<$Res> {
  factory $LifespanRangeCopyWith(
          LifespanRange value, $Res Function(LifespanRange) then) =
      _$LifespanRangeCopyWithImpl<$Res, LifespanRange>;
  @useResult
  $Res call({DateTime birthDate, DateTime deathDate});
}

/// @nodoc
class _$LifespanRangeCopyWithImpl<$Res, $Val extends LifespanRange>
    implements $LifespanRangeCopyWith<$Res> {
  _$LifespanRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? deathDate = null,
  }) {
    return _then(_value.copyWith(
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deathDate: null == deathDate
          ? _value.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifespanRangeImplCopyWith<$Res>
    implements $LifespanRangeCopyWith<$Res> {
  factory _$$LifespanRangeImplCopyWith(
          _$LifespanRangeImpl value, $Res Function(_$LifespanRangeImpl) then) =
      __$$LifespanRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime birthDate, DateTime deathDate});
}

/// @nodoc
class __$$LifespanRangeImplCopyWithImpl<$Res>
    extends _$LifespanRangeCopyWithImpl<$Res, _$LifespanRangeImpl>
    implements _$$LifespanRangeImplCopyWith<$Res> {
  __$$LifespanRangeImplCopyWithImpl(
      _$LifespanRangeImpl _value, $Res Function(_$LifespanRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? deathDate = null,
  }) {
    return _then(_$LifespanRangeImpl(
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deathDate: null == deathDate
          ? _value.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LifespanRangeImpl implements _LifespanRange {
  _$LifespanRangeImpl({required this.birthDate, required this.deathDate});

  factory _$LifespanRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifespanRangeImplFromJson(json);

  @override
  final DateTime birthDate;
  @override
  final DateTime deathDate;

  @override
  String toString() {
    return 'LifespanRange(birthDate: $birthDate, deathDate: $deathDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifespanRangeImpl &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, birthDate, deathDate);

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LifespanRangeImplCopyWith<_$LifespanRangeImpl> get copyWith =>
      __$$LifespanRangeImplCopyWithImpl<_$LifespanRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifespanRangeImplToJson(
      this,
    );
  }
}

abstract class _LifespanRange implements LifespanRange {
  factory _LifespanRange(
      {required final DateTime birthDate,
      required final DateTime deathDate}) = _$LifespanRangeImpl;

  factory _LifespanRange.fromJson(Map<String, dynamic> json) =
      _$LifespanRangeImpl.fromJson;

  @override
  DateTime get birthDate;
  @override
  DateTime get deathDate;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LifespanRangeImplCopyWith<_$LifespanRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
