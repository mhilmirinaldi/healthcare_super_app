import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_detail/get_dokter_detail.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_detail/get_dokter_detail_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_dokter_detail_provider.dart';

part 'dokter_detail_provider.g.dart';

@riverpod
Future<Dokter?> dokterDetail(DokterDetailRef ref, {required String id}) async{
  GetDokterDetail getDokterDetail = ref.read(getDokterDetailProvider);

  var result = await getDokterDetail(GetDokterDetailParam(id: id));

  if(result.isSuccess){
    return result.resultValue!;
  } else {
    return null;
  }
}