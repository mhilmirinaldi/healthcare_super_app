import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_obat_by_kategori/get_obat_by_kategori_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetObatByKategori implements UseCase<Result<List<Obat>>, GetObatByKategoriParam>{
  final ObatRepository _obatRepository;

  GetObatByKategori({required ObatRepository obatRepository}) : _obatRepository = obatRepository;
  
  @override
  Future<Result<List<Obat>>> call(GetObatByKategoriParam params) async {
    var result = await _obatRepository.getObatByKategori(idKategori: params.idKategori);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}