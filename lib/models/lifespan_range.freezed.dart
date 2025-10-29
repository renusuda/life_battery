// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 DateTime get birthDate; DateTime get deathDate;
/// Create a copy of LifespanRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LifespanRangeCopyWith<LifespanRange> get copyWith => _$LifespanRangeCopyWithImpl<LifespanRange>(this as LifespanRange, _$identity);

  /// Serializes this LifespanRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LifespanRange&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.deathDate, deathDate) || other.deathDate == deathDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,birthDate,deathDate);

@override
String toString() {
  return 'LifespanRange(birthDate: $birthDate, deathDate: $deathDate)';
}


}

/// @nodoc
abstract mixin class $LifespanRangeCopyWith<$Res>  {
  factory $LifespanRangeCopyWith(LifespanRange value, $Res Function(LifespanRange) _then) = _$LifespanRangeCopyWithImpl;
@useResult
$Res call({
 DateTime birthDate, DateTime deathDate
});




}
/// @nodoc
class _$LifespanRangeCopyWithImpl<$Res>
    implements $LifespanRangeCopyWith<$Res> {
  _$LifespanRangeCopyWithImpl(this._self, this._then);

  final LifespanRange _self;
  final $Res Function(LifespanRange) _then;

/// Create a copy of LifespanRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? birthDate = null,Object? deathDate = null,}) {
  return _then(_self.copyWith(
birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,deathDate: null == deathDate ? _self.deathDate : deathDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LifespanRange].
extension LifespanRangePatterns on LifespanRange {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LifespanRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LifespanRange() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LifespanRange value)  $default,){
final _that = this;
switch (_that) {
case _LifespanRange():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LifespanRange value)?  $default,){
final _that = this;
switch (_that) {
case _LifespanRange() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime birthDate,  DateTime deathDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LifespanRange() when $default != null:
return $default(_that.birthDate,_that.deathDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime birthDate,  DateTime deathDate)  $default,) {final _that = this;
switch (_that) {
case _LifespanRange():
return $default(_that.birthDate,_that.deathDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime birthDate,  DateTime deathDate)?  $default,) {final _that = this;
switch (_that) {
case _LifespanRange() when $default != null:
return $default(_that.birthDate,_that.deathDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LifespanRange extends LifespanRange {
   _LifespanRange({required this.birthDate, required this.deathDate}): super._();
  factory _LifespanRange.fromJson(Map<String, dynamic> json) => _$LifespanRangeFromJson(json);

@override final  DateTime birthDate;
@override final  DateTime deathDate;

/// Create a copy of LifespanRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifespanRangeCopyWith<_LifespanRange> get copyWith => __$LifespanRangeCopyWithImpl<_LifespanRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LifespanRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifespanRange&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.deathDate, deathDate) || other.deathDate == deathDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,birthDate,deathDate);

@override
String toString() {
  return 'LifespanRange(birthDate: $birthDate, deathDate: $deathDate)';
}


}

/// @nodoc
abstract mixin class _$LifespanRangeCopyWith<$Res> implements $LifespanRangeCopyWith<$Res> {
  factory _$LifespanRangeCopyWith(_LifespanRange value, $Res Function(_LifespanRange) _then) = __$LifespanRangeCopyWithImpl;
@override @useResult
$Res call({
 DateTime birthDate, DateTime deathDate
});




}
/// @nodoc
class __$LifespanRangeCopyWithImpl<$Res>
    implements _$LifespanRangeCopyWith<$Res> {
  __$LifespanRangeCopyWithImpl(this._self, this._then);

  final _LifespanRange _self;
  final $Res Function(_LifespanRange) _then;

/// Create a copy of LifespanRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? birthDate = null,Object? deathDate = null,}) {
  return _then(_LifespanRange(
birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,deathDate: null == deathDate ? _self.deathDate : deathDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
