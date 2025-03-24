import 'package:flutter/material.dart';

enum TaskStatus {
  inProgress,
  newTask,
  waitingForExpert,
}

extension TaskStatusExtension on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.newTask:
        return "New";
      case TaskStatus.waitingForExpert:
        return "Waiting for Expert";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TaskStatus.inProgress:
        return Color.fromRGBO(176, 222, 255, 1.0);
      case TaskStatus.newTask:
        return Color.fromRGBO(200, 255, 202, 1.0);
      case TaskStatus.waitingForExpert:
        return Color.fromRGBO(255, 232, 188, 1.0);
    }
  }


  Color get fontColor {
    switch (this) {
      case TaskStatus.inProgress:
        return Color.fromRGBO(53, 110, 156, 1.0);
      case TaskStatus.newTask:
        return Color.fromRGBO(89, 152, 91, 1.0);
      case TaskStatus.waitingForExpert:
        return Color.fromRGBO(154, 133, 95, 1.0);
    }
  }
}

TaskStatus? getTaskStatus(String status) {
  switch (status) {
    case "in_progress":
      return TaskStatus.inProgress;
    case "new":
      return TaskStatus.newTask;
    case "waiting_for_expert":
      return TaskStatus.waitingForExpert;
    default:
      return null;
  }
}

Widget buildStatusBadge(String status) {
  TaskStatus? taskStatus = getTaskStatus(status);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: taskStatus?.backgroundColor ?? Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      taskStatus?.label ?? status,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: taskStatus?.fontColor ?? Colors.black,
      ),
    ),
  );
}
