import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class DokterRepository{
  Future<Result<List<RekomendasiDokter>>> getRekomendasiDokter();
  Future<Result<List<RekomendasiDokter>>> getDokterByKategori({required String idKategori});
  Future<Result<Dokter>> getDokterDetail({required String id});
}