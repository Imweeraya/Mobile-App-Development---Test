// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
  name: json['name'] as String,
  status: json['status'] as String,
  description: json['description'] as String,
  goal: json['goal'] as String,
  expertId: (json['expertId'] as num).toInt(),
);

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
  'goal': instance.goal,
  'expertId': instance.expertId,
};
