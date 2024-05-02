import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/logout/logout.dart';
import 'package:super_app_telemedicine/ui/provider/repository/authentication/authentication_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref){
  return Logout(authentication: ref.watch(authenticationProvider));
}