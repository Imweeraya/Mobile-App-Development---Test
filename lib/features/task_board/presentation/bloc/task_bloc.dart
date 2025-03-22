import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecase/get_task_list_use_case.dart';


part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTaskListUseCase getTaskListUseCase;

  TaskBloc(this.getTaskListUseCase) : super(TaskInitial()) {
    on<GetTaskList>(_onGetTaskList);
  }

  Future<void> _onGetTaskList(GetTaskList event, Emitter<TaskState> emit) async {
    emit(TaskLoading());

    final Either<Failure, List<TaskEntity>> result = await getTaskListUseCase();

    result.fold(
          (failure) => emit(TaskFailure(message: failure.message)),
          (taskList) => emit(TaskLoaded(taskList: taskList)),
    );
  }
}
