import 'package:dio/dio.dart';

import '../../../../../core/error/exception.dart';
import '../../model/task_model.dart';
import 'task_service.dart';


abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTaskList();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final TaskService service;

  TaskRemoteDataSourceImpl({required this.service});

  @override
  Future<List<TaskModel>> getTaskList() async {
    try {
      var response = await service.getTaskList();
      return response.data;
    } on DioException catch (e) {
      throw ServerException(message: e.response?.statusMessage ?? "Something went wrong", statusCode: e.response?.statusCode);
    }
  }
}
