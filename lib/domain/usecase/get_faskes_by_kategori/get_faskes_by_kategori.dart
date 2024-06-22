import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/get_faskes_by_kategori/get_faskes_by_kategori_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetFaskesByKategori implements UseCase<Result<List<Faskes>>, GetFaskesByKategoriParam>{
  final FaskesRepository _faskesRepository;

  GetFaskesByKategori({required FaskesRepository faskesRepository}) : _faskesRepository = faskesRepository;
  
  @override
  Future<Result<List<Faskes>>> call(GetFaskesByKategoriParam params) async {
    var result = await _faskesRepository.getFaskesByKategori(idKategori: params.idKategori);

    if(result.isSuccess){
      return Result.success(result.resultValue!);
    } else {
      return Result.failed(result.errorMessage!);
    }
  }
  
}