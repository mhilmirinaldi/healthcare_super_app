import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_detail/get_faskes_detail.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_detail/get_faskes_detail_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_faskes_detail_provider.dart';

part 'faskes_detail_provider.g.dart';

@riverpod
Future<Faskes?> faskesDetail(FaskesDetailRef ref, {required String id}) async{
  GetFaskesDetail getFaskesDetail = ref.read(getFaskesDetailProvider);

  var result = await getFaskesDetail(GetFaskesDetailParam(id: id));

  if(result.isSuccess){
    return result.resultValue!;
  } else {
    return null;
  }
}