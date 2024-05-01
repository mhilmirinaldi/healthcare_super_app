import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_dokter_by_kategori/get_dokter_by_kategori_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetDokterByKategori implements UseCase<Result<List<RekomendasiDokter>>, GetDokterByKategoriParam>{
  final DokterRepository _dokterRepository;

  GetDokterByKategori({required DokterRepository dokterRepository}) : _dokterRepository = dokterRepository;
  
  @override
  Future<Result<List<RekomendasiDokter>>> call(GetDokterByKategoriParam params) async {
    var result = await _dokterRepository.getDokterByKategori(idKategori: params.idKategori);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}