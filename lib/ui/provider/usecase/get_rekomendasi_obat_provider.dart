import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_obat/get_rekomendasi_obat.dart';
import 'package:super_app_telemedicine/ui/provider/repository/obat_repository/obat_repository_provider.dart';

part 'get_rekomendasi_obat_provider.g.dart';

@riverpod
GetRekomendasiObat getRekomendasiObat(GetRekomendasiObatRef ref){
  return GetRekomendasiObat(obatRepository: ref.watch(obatRepositoryProvider));
}