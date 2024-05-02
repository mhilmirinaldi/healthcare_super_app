import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_detail/get_dokter_detail.dart';
import 'package:super_app_telemedicine/ui/provider/repository/dokter_repository/dokter_repository_provider.dart';

part 'get_dokter_detail_provider.g.dart';

@riverpod
GetDokterDetail getDokterDetail(GetDokterDetailRef ref){
  return GetDokterDetail(dokterRepository: ref.watch(dokterRepositoryProvider));
}