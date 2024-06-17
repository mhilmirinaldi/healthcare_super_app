import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

class FirebaseDokterRepository implements DokterRepository{
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseDokterRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<Dokter>>> getDokterByKategori({required String idKategori}) async{
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('dokter');

    try {
      var result = await documentReference.where('idKategori', isEqualTo: idKategori).get();

      if(result.docs.isNotEmpty){
        return Result.success(result.docs.map((e) => Dokter.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Dokter>> getDokterDetail({required String id}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('dokter');

    try {
      var result = await documentReference.where('id', isEqualTo: id).get();

      if(result.docs.isNotEmpty){
        return Result.success(Dokter.fromJson(result.docs.first.data()));
      } else {
        return const Result.failed('Dokter not found');
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Dokter>>> getRekomendasiDokter() async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('dokter');

    try {
      var result = await documentReference.limit(2).get();

      if(result.docs.isNotEmpty){
        return Result.success(result.docs.map((e) => Dokter.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
  
}