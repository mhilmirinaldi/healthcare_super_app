import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';

abstract interface class UserRepository{
  Future<Result<User>> createUser({
    required String id,
    required String email,
    required String name,
  });

  Future<Result<User>> getUser({required String id});
  Future<Result<User>> updateUser({required User user});
  Future<Result<String>> getName({required String id});
}