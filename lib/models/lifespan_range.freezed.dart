// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lifespan_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LifespanRange {
  DateTime get birthDate;
  DateTime get deathDate;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LifespanRangeCopyWith<LifespanRange> get copyWith =>
      _$LifespanRangeCopyWithImpl<LifespanRange>(
          this as LifespanRange, _$identity);

  /// Serializes this LifespanRange to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LifespanRange &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, birthDate, deathDate);

  @override
  String toString() {
    return 'LifespanRange(birthDate: $birthDate, deathDate: $deathDate)';
  }
}

/// @nodoc
abstract mixin class $LifespanRangeCopyWith<$Res> {
  factory $LifespanRangeCopyWith(
          LifespanRange value, $Res Function(LifespanRange) _then) =
      _$LifespanRangeCopyWithImpl;
  @useResult
  $Res call({DateTime birthDate, DateTime deathDate});
}

/// @nodoc
class _$LifespanRangeCopyWithImpl<$Res>
    implements $LifespanRangeCopyWith<$Res> {
  _$LifespanRangeCopyWithImpl(this._self, this._then);

  final LifespanRange _self;
  final $Res Function(LifespanRange) _then;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? deathDate = null,
  }) {
    return _then(_self.copyWith(
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deathDate: null == deathDate
          ? _self.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LifespanRange extends LifespanRange {
  _LifespanRange({required this.birthDate, required this.deathDate})
      : super._();
  factory _LifespanRange.fromJson(Map<String, dynamic> json) =>
      _$LifespanRangeFromJson(json);

  @override
  final DateTime birthDate;
  @override
  final DateTime deathDate;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LifespanRangeCopyWith<_LifespanRange> get copyWith =>
      __$LifespanRangeCopyWithImpl<_LifespanRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LifespanRangeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LifespanRange &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, birthDate, deathDate);

  @override
  String toString() {
    return 'LifespanRange(birthDate: $birthDate, deathDate: $deathDate)';
  }
}

/// @nodoc
abstract mixin class _$LifespanRangeCopyWith<$Res>
    implements $LifespanRangeCopyWith<$Res> {
  factory _$LifespanRangeCopyWith(
          _LifespanRange value, $Res Function(_LifespanRange) _then) =
      __$LifespanRangeCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime birthDate, DateTime deathDate});
}

/// @nodoc
class __$LifespanRangeCopyWithImpl<$Res>
    implements _$LifespanRangeCopyWith<$Res> {
  __$LifespanRangeCopyWithImpl(this._self, this._then);

  final _LifespanRange _self;
  final $Res Function(_LifespanRange) _then;

  /// Create a copy of LifespanRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? birthDate = null,
    Object? deathDate = null,
  }) {
    return _then(_LifespanRange(
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deathDate: null == deathDate
          ? _self.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
