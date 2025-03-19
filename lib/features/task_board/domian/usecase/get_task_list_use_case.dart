import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTaskListUseCase {
  final TaskRepository repository;

  GetTaskListUseCase(this.repository);

  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await repository.getTaskList();
  }
}
