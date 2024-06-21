import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_obat_repository.dart';
import 'package:super_app_telemedicine/data/repository/kategori_obat_repository.dart';

part 'kategori_obat_repository_provider.g.dart';

@riverpod
KategoriObatRepository kategoriObatRepository(KategoriObatRepositoryRef ref){
  return FirebaseKategoriObatRepository();
}