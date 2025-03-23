part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
}

final class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}


class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<TaskEntity> taskList;
  final User userData;

  const TaskLoaded({required this.taskList, required this.userData});

  @override
  List<Object> get props => [taskList];
}

class TaskFailure extends TaskState {
  final String message;
  final int? statusCode;

  const TaskFailure({required this.message, this.statusCode});

  @override
  List<Object> get props => [message];
}

