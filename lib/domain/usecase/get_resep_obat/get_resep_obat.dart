import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetResepObat implements UseCase<Result<List<Obat>>, void> {
  final ObatRepository _obatRepository;

  GetResepObat({required ObatRepository obatRepository}) : _obatRepository = obatRepository;

  @override
  Future<Result<List<Obat>>> call(void _) async {
    var result = await _obatRepository.getResepObat();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}