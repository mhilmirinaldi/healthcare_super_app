import 'dart:async';

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
  Future<Result<void>> changePassword(
      {required String email,
      required String currentPassword,
      required String newPassword});
  String? getLoggedInUserId();
}
