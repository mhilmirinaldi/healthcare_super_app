import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetRekomendasiFaskes implements UseCase<Result<List<Faskes>>, void> {
  final FaskesRepository _faskesRepository;

  GetRekomendasiFaskes({required FaskesRepository faskesRepository}) : _faskesRepository = faskesRepository;

  @override
  Future<Result<List<Faskes>>> call(void _) async {
    var result = await _faskesRepository.getRekomendasiFaskes();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}