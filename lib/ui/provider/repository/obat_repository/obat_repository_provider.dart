import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_obat_repository.dart';
import 'package:super_app_telemedicine/data/repository/obat_repository.dart';

part 'obat_repository_provider.g.dart';

@riverpod
ObatRepository obatRepository(ObatRepositoryRef ref){
  return FirebaseObatRepository();
}