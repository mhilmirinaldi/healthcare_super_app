import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetRekomendasiObat implements UseCase<Result<List<Obat>>, void> {
  final ObatRepository _obatRepository;

  GetRekomendasiObat({required ObatRepository obatRepository}) : _obatRepository = obatRepository;

  @override
  Future<Result<List<Obat>>> call(void _) async {
    var result = await _obatRepository.getRekomendasiObat();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}