import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_by_kategori/get_dokter_by_kategori.dart';
import 'package:super_app_telemedicine/ui/provider/repository/dokter_repository/dokter_repository_provider.dart';

part 'get_dokter_by_kategori_provider.g.dart';

@riverpod
GetDokterByKategori getDokterByKategori(GetDokterByKategoriRef ref){
  return GetDokterByKategori(dokterRepository: ref.watch(dokterRepositoryProvider));
}