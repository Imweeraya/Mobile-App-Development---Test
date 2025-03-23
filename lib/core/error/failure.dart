abstract class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure(String message, {int? statusCode}) : super(message, statusCode: statusCode);
}

class CacheFailure extends Failure {
  CacheFailure(String message, {int? statusCode}) : super(message, statusCode: statusCode);
}
