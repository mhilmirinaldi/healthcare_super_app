import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_authentication.dart';
import 'package:super_app_telemedicine/data/repository/authentication.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) {
  return FirebaseAuthentication();
}