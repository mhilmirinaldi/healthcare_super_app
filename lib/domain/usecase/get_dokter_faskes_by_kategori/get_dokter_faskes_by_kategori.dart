import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_faskes_by_kategori/get_dokter_faskes_by_kategori_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetDokterFaskesByKategori implements UseCase<Result<List<Dokter>>, GetDokterFaskesByKategoriParam>{
  final FaskesRepository _faskesRepository;

  GetDokterFaskesByKategori({required FaskesRepository faskesRepository}) : _faskesRepository = faskesRepository;
  
  @override
  Future<Result<List<Dokter>>> call(GetDokterFaskesByKategoriParam params) async {
    var result = await _faskesRepository.getDokterFaskesByKategori(idKategori: params.idKategori);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}