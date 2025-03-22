part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTaskList extends TaskEvent {
  GetTaskList();

  @override
  List<Object> get props => [];
}

