import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

abstract interface class ObatRepository{
  Future<Result<List<Obat>>> getRekomendasiObat();
  Future<Result<List<Obat>>> getObatByKategori({required String idKategori});
  Future<Result<Obat>> getObatDetail({required String id});
  Future<Result<List<Obat>>> searchObat(String query);
  Future<Result<List<Obat>>> searchObatWithKategori(String query, String idKategori);
  Future<Result<List<Obat>>> getResepObat();
}