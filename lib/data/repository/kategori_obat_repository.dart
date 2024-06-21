import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class KategoriObatRepository {
  Future<Result<List<KategoriObat>>> getKategoriObat();
}