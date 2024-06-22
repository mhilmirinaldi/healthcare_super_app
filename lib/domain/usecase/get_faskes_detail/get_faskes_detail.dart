import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_detail/get_faskes_detail_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetFaskesDetail implements UseCase<Result<Faskes>, GetFaskesDetailParam> {
  final FaskesRepository _faskesRepository;

  GetFaskesDetail({required FaskesRepository faskesRepository}) : _faskesRepository = faskesRepository;

  @override
  Future<Result<Faskes>> call(GetFaskesDetailParam params) async {
    var result = await _faskesRepository.getFaskesDetail(id: params.id);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}