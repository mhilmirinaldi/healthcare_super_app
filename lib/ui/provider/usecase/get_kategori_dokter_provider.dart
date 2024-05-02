import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_dokter/get_kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/repository/kategori_dokter_repository/kategori_dokter_repository_provider.dart';

part 'get_kategori_dokter_provider.g.dart';

@riverpod
GetKategoriDokter getKategoriDokter(GetKategoriDokterRef ref){
  return GetKategoriDokter(kategoriDokterRepository: ref.watch(kategoriDokterRepositoryProvider));
}