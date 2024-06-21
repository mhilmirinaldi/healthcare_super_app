import 'package:super_app_telemedicine/data/repository/kategori_obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetKategoriObat implements UseCase<Result<List<KategoriObat>>, void> {
  final KategoriObatRepository _kategoriObatRepository;

  GetKategoriObat({required KategoriObatRepository kategoriObatRepository}) : _kategoriObatRepository = kategoriObatRepository;

  @override
  Future<Result<List<KategoriObat>>> call(void _) async {
    var result = await _kategoriObatRepository.getKategoriObat();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}