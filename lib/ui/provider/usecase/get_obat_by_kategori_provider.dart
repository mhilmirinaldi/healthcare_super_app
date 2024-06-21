import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_by_kategori/get_obat_by_kategori.dart';
import 'package:super_app_telemedicine/ui/provider/repository/obat_repository/obat_repository_provider.dart';

part 'get_obat_by_kategori_provider.g.dart';

@riverpod
GetObatByKategori getObatByKategori(GetObatByKategoriRef ref){
  return GetObatByKategori(obatRepository: ref.watch(obatRepositoryProvider));
}