import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/task.dart';


abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getTaskList();
}
