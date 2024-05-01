import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetRekomendasiDokter implements UseCase<Result<List<RekomendasiDokter>>, void> {
  final DokterRepository _dokterRepository;

  GetRekomendasiDokter({required DokterRepository dokterRepository}) : _dokterRepository = dokterRepository;

  @override
  Future<Result<List<RekomendasiDokter>>> call(void _) async {
    var result = await _dokterRepository.getRekomendasiDokter();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}