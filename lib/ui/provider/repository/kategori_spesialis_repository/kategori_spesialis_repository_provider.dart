import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_spesialis_repository.dart';
import 'package:super_app_telemedicine/data/repository/kategori_spesialis_repository.dart';

part 'kategori_spesialis_repository_provider.g.dart';

@riverpod
KategoriSpesialisRepository kategoriSpesialisRepository(KategoriSpesialisRepositoryRef ref){
  return FirebaseKategoriSpesialisRepository();
}