// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LifespanRange _$LifespanRangeFromJson(Map<String, dynamic> json) =>
    _LifespanRange(
      birthDate: DateTime.parse(json['birthDate'] as String),
      deathDate: DateTime.parse(json['deathDate'] as String),
    );

Map<String, dynamic> _$LifespanRangeToJson(_LifespanRange instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate.toIso8601String(),
      'deathDate': instance.deathDate.toIso8601String(),
    };
