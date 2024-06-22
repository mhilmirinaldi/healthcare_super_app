import 'package:super_app_telemedicine/data/repository/kategori_spesialis_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetKategoriSpesialis implements UseCase<Result<List<KategoriSpesialis>>, void> {
  final KategoriSpesialisRepository _kategoriSpesialisRepository;

  GetKategoriSpesialis({required KategoriSpesialisRepository kategoriSpesialisRepository}) : _kategoriSpesialisRepository = kategoriSpesialisRepository;

  @override
  Future<Result<List<KategoriSpesialis>>> call(void _) async {
    var result = await _kategoriSpesialisRepository.getKategoriSpesialis();

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
}