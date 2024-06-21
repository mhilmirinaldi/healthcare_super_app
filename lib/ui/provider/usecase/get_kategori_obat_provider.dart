import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_obat/get_kategori_obat.dart';
import 'package:super_app_telemedicine/ui/provider/repository/kategori_obat_repository/kategori_obat_repository_provider.dart';

part 'get_kategori_obat_provider.g.dart';

@riverpod
GetKategoriObat getKategoriObat(GetKategoriObatRef ref){
  return GetKategoriObat(kategoriObatRepository: ref.watch(kategoriObatRepositoryProvider));
}