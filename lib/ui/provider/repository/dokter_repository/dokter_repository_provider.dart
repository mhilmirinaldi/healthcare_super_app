import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_dokter_repository.dart';
import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';

part 'dokter_repository_provider.g.dart';

@riverpod
DokterRepository dokterRepository(DokterRepositoryRef ref){
  return FirebaseDokterRepository();
}