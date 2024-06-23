import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class FaskesRepository{
  Future<Result<List<Faskes>>> getRekomendasiFaskes();
  Future<Result<List<Faskes>>> getFaskesByKategori({required String idKategori});
  Future<Result<Faskes>> getFaskesDetail({required String id});
  Future<Result<List<Faskes>>> searchFaskes(String query);
  Future<Result<List<Faskes>>> searchFaskesWithKategori(String query, String idKategori);
  Future<Result<List<Dokter>>> getDokterFaskesByKategori({required String idKategori});
  Future<Result<List<Dokter>>> searchDokterFaskesWithKategori(String query, String idKategori);
  Future<Result<double>> searchJarakByFaskes({required String namaFaskes});
}