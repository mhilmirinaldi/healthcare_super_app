import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class KategoriDokterRepository {
  Future<Result<List<KategoriDokter>>> getKategoriDokter();
}