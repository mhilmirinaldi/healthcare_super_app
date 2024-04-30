import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_user_repository.dart';
import 'package:super_app_telemedicine/data/repository/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref){
  return FirebaseUserRepository();
}