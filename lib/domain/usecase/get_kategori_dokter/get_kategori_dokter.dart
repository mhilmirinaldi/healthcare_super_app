import 'package:super_app_telemedicine/data/repository/kategori_dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetKategoriDokter implements UseCase<Result<List<KategoriDokter>>, void> {
  final KategoriDokterRepository _kategoriDokterRepository;

  GetKategoriDokter({required KategoriDokterRepository kategoriDokterRepository}) : _kategoriDokterRepository = kategoriDokterRepository;

  @override
  Future<Result<List<KategoriDokter>>> call(void _) async {
    var result = await _kategoriDokterRepository.getKategoriDokter();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}