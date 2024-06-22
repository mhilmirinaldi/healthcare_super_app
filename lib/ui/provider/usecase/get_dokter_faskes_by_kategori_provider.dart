import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_faskes_by_kategori/get_dokter_faskes_by_kategori.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/faskes_repository_provider.dart';

part 'get_dokter_faskes_by_kategori_provider.g.dart';

@riverpod
GetDokterFaskesByKategori getDokterFaskesByKategori(GetDokterFaskesByKategoriRef ref){
  return GetDokterFaskesByKategori(faskesRepository: ref.watch(faskesRepositoryProvider));
}