// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifespan_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LifespanRangeImpl _$$LifespanRangeImplFromJson(Map<String, dynamic> json) =>
    _$LifespanRangeImpl(
      birthDate: DateTime.parse(json['birthDate'] as String),
      deathDate: DateTime.parse(json['deathDate'] as String),
    );

Map<String, dynamic> _$$LifespanRangeImplToJson(_$LifespanRangeImpl instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate.toIso8601String(),
      'deathDate': instance.deathDate.toIso8601String(),
    };
