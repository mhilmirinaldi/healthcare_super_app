import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_detail/get_dokter_detail_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetDokterDetail implements UseCase<Result<Dokter>, GetDokterDetailParam> {
  final DokterRepository _dokterRepository;

  GetDokterDetail({required DokterRepository dokterRepository}) : _dokterRepository = dokterRepository;

  @override
  Future<Result<Dokter>> call(GetDokterDetailParam params) async {
    var result = await _dokterRepository.getDokterDetail(id: params.id);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}