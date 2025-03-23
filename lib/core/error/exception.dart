class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message ,this.statusCode});

  @override
  String toString() => 'ServerException: $message (Status Code: $statusCode)';
}

class CacheException implements Exception {
  final String message;
  final int? statusCode;

  CacheException({required this.message, this.statusCode});

  @override
  String toString() => 'CacheException: $message (Status Code: $statusCode)';
}
