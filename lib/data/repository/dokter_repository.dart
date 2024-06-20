import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class DokterRepository{
  Future<Result<List<Dokter>>> getRekomendasiDokter();
  Future<Result<List<Dokter>>> getDokterByKategori({required String idKategori});
  Future<Result<Dokter>> getDokterDetail({required String id});
  Future<Result<List<Dokter>>> searchDokter(String query);
  Future<Result<List<Dokter>>> searchDokterWithKategori(String query, String idKategori);
}