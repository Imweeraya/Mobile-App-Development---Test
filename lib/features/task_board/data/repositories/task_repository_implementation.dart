import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasource/remote/task_remote_data_source.dart';
import '../model/task_model.dart';


class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TaskEntity>>> getTaskList() async {
    print("HELLOOOOO");
    try {
      final List<TaskModel> taskModels = await remoteDataSource.getTaskList();
      final List<TaskEntity> taskEntities = taskModels.map((task) => TaskEntity(
        name: task.name,
        status: task.status,
        description: task.description,
        goal: task.goal,
        expertId: task.expertId,
      )).toList();

      return Right(taskEntities);
    } catch (e) {
      print("HELLOOOOO2 ${e.toString()}");
      return Left(ServerFailure(e.toString()));
    }
  }
}
