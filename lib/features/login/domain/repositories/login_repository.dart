import '../../../../core/error/failure.dart';
import '../entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class LoginRepository {
  Future<Either<Failure, User>> login(String email, String password);
}
