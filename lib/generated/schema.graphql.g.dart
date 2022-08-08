// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input$FinishPomodoroInput _$Input$FinishPomodoroInputFromJson(
        Map<String, dynamic> json) =>
    Input$FinishPomodoroInput(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$Input$FinishPomodoroInputToJson(
        Input$FinishPomodoroInput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
    };
