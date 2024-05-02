import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:super_app_telemedicine/ui/provider/repository/authentication/authentication_provider.dart';
import 'package:super_app_telemedicine/ui/provider/repository/user_repository/user_repository_provider.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) {
  return GetLoggedInUser(
      authentication: ref.watch(authenticationProvider),
      userRepository: ref.watch(userRepositoryProvider));
}
