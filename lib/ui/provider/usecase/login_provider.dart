import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/login/login.dart';
import 'package:super_app_telemedicine/ui/provider/repository/authentication/authentication_provider.dart';
import 'package:super_app_telemedicine/ui/provider/repository/user_repository/user_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) {
  return Login(authentication: ref.watch(authenticationProvider), userRepository: ref.watch(userRepositoryProvider));
}