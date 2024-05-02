import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/register/register.dart';
import 'package:super_app_telemedicine/ui/provider/repository/authentication/authentication_provider.dart';
import 'package:super_app_telemedicine/ui/provider/repository/user_repository/user_repository_provider.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) {
  return Register(
      userRepository: ref.watch(userRepositoryProvider),
      authentication: ref.watch(authenticationProvider));
}
