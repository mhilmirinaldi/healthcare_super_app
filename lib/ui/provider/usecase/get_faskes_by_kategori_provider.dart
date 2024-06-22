import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_by_kategori/get_faskes_by_kategori.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/faskes_repository_provider.dart';

part 'get_faskes_by_kategori_provider.g.dart';

@riverpod
GetFaskesByKategori getFaskesByKategori(GetFaskesByKategoriRef ref){
  return GetFaskesByKategori(faskesRepository: ref.watch(faskesRepositoryProvider));
}