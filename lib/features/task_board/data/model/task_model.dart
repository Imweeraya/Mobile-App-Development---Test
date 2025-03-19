import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String name;
  final String status;
  final String description;
  final String goal;
  final int expertId;

  TaskModel({
    required this.name,
    required this.status,
    required this.description,
    required this.goal,
    required this.expertId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}