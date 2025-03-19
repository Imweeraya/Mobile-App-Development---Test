import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../../model/task_model.dart';

part 'task_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class TaskService {
  factory TaskService(Dio dio) = _TaskService;

  @GET("/public/applicant-tasks")
  Future<HttpResponse<List<TaskModel>>> getTaskList();
}
