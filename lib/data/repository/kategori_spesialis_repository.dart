import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class KategoriSpesialisRepository {
  Future<Result<List<KategoriSpesialis>>> getKategoriSpesialis();
}