import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_rekomendasi_dokter/get_rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/repository/dokter_repository/dokter_repository_provider.dart';

part 'get_rekomendasi_dokter_provider.g.dart';

@riverpod
GetRekomendasiDokter getRekomendasiDokter(GetRekomendasiDokterRef ref){
  return GetRekomendasiDokter(dokterRepository: ref.watch(dokterRepositoryProvider));
}