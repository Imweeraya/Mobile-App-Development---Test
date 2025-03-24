import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../login/domain/entities/user.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecase/get_task_list_use_case.dart';
import '../../domain/usecase/get_user_data_use_case.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTaskListUseCase getTaskListUseCase;
  final GetUserDataUseCase getUserDataUseCase;

  TaskBloc({required this.getTaskListUseCase, required this.getUserDataUseCase})
    : super(TaskInitial()) {
    on<GetTaskList>(_onGetTaskList);
  }

  Future<void> _onGetTaskList(
      GetTaskList event,
      Emitter<TaskState> emit,
      ) async {
    emit(TaskLoading());

    final Either<Failure, List<TaskEntity>> taskList = await getTaskListUseCase();
    final Either<Failure, User?> result = await getUserDataUseCase.getUserData();

    taskList.fold(
          (failure) => emit(
        TaskFailure(message: failure.message, statusCode: failure.statusCode),
      ),
          (taskList) {
            taskList.add(TaskEntity(name: "Task 4.", status: "in_progress", description: "That means you can't use the result of this method call in an expression.That means you can't use the result of this method call in an expression.", goal: "API; there might be a function or call that returns void you didn't expect. Also check type parameters and variables which might also be void", expertId: 1));

            result.fold(
              (failure) => emit(
            TaskFailure(message: failure.message, statusCode: failure.statusCode),
          ),
              (user) => emit(TaskLoaded(taskList: taskList, userData: user!)),
        );
      },
    );
  }}
