import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_dokter_repository.dart';
import 'package:super_app_telemedicine/data/repository/kategori_dokter_repository.dart';

part 'kategori_dokter_repository_provider.g.dart';

@riverpod
KategoriDokterRepository kategoriDokterRepository(KategoriDokterRepositoryRef ref){
  return FirebaseKategoriDokterRepository();
}