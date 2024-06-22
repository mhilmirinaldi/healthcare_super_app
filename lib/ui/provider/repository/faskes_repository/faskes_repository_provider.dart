import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_faskes_repository.dart';
import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';

part 'faskes_repository_provider.g.dart';

@riverpod
FaskesRepository faskesRepository(FaskesRepositoryRef ref){
  return FirebaseFaskesRepository();
}