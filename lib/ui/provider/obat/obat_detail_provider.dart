import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_detail/get_obat_detail.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_detail/get_obat_detail_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_obat_detail_provider.dart';

part 'obat_detail_provider.g.dart';

@riverpod
Future<Obat?> obatDetail(ObatDetailRef ref, {required String id}) async{
  GetObatDetail getObatDetail = ref.read(getObatDetailProvider);

  var result = await getObatDetail(GetObatDetailParam(id: id));

  if(result.isSuccess){
    return result.resultValue!;
  } else {
    return null;
  }
}