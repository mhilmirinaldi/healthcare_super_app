import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_detail/get_obat_detail_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetObatDetail implements UseCase<Result<Obat>, GetObatDetailParam> {
  final ObatRepository _obatRepository;

  GetObatDetail({required ObatRepository obatRepository}) : _obatRepository = obatRepository;

  @override
  Future<Result<Obat>> call(GetObatDetailParam params) async {
    var result = await _obatRepository.getObatDetail(id: params.id);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}