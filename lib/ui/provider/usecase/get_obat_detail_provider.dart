import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_detail/get_obat_detail.dart';
import 'package:super_app_telemedicine/ui/provider/repository/obat_repository/obat_repository_provider.dart';

part 'get_obat_detail_provider.g.dart';

@riverpod
GetObatDetail getObatDetail(GetObatDetailRef ref){
  return GetObatDetail(obatRepository: ref.watch(obatRepositoryProvider));
}