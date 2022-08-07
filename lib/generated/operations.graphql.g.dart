// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fragment$pomodoro _$Fragment$pomodoroFromJson(Map<String, dynamic> json) =>
    Fragment$pomodoro(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$pomodoroToJson(Fragment$pomodoro instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      '__typename': instance.$__typename,
    };

Query$getPomodoros _$Query$getPomodorosFromJson(Map<String, dynamic> json) =>
    Query$getPomodoros(
      pomodoros: (json['pomodoros'] as List<dynamic>)
          .map((e) => Fragment$pomodoro.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$getPomodorosToJson(Query$getPomodoros instance) =>
    <String, dynamic>{
      'pomodoros': instance.pomodoros.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Variables$Mutation$finishPomodoro _$Variables$Mutation$finishPomodoroFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$finishPomodoro(
      input: json['input'] == null
          ? null
          : Input$FinishPomodoroInput.fromJson(
              json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$finishPomodoroToJson(
        Variables$Mutation$finishPomodoro instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

Mutation$finishPomodoro _$Mutation$finishPomodoroFromJson(
        Map<String, dynamic> json) =>
    Mutation$finishPomodoro(
      finishPomodoro: Fragment$pomodoro.fromJson(
          json['finishPomodoro'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$finishPomodoroToJson(
        Mutation$finishPomodoro instance) =>
    <String, dynamic>{
      'finishPomodoro': instance.finishPomodoro.toJson(),
      '__typename': instance.$__typename,
    };
