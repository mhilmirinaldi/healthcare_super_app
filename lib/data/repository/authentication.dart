import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class Authentication {
  Future<Result<String>> register({
    required String email,
    required String password,
  });
  Future<Result<String>> login({
    required String email,
    required String password,
  });
  Future<Result<void>> logout();
  Future<Result<void>> resetPassword({required String email});
  String? getLoggedInUserId();
}
