import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_spesialis/get_kategori_spesialis.dart';
import 'package:super_app_telemedicine/ui/provider/repository/kategori_spesialis_repository/kategori_spesialis_repository_provider.dart';

part 'get_kategori_spesialis_provider.g.dart';

@riverpod
GetKategoriSpesialis getKategoriSpesialis(GetKategoriSpesialisRef ref){
  return GetKategoriSpesialis(kategoriSpesialisRepository: ref.watch(kategoriSpesialisRepositoryProvider));
}