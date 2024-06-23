import 'package:super_app_telemedicine/data/repository/kategori_spesialis_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseKategoriSpesialisRepository implements KategoriSpesialisRepository{
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseKategoriSpesialisRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<KategoriSpesialis>>> getKategoriSpesialis() async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriSpesialis');

    try {
      var result = await documentReference.get();

      if(result.docs.isNotEmpty){
        return Result.success(result.docs.map((e) => KategoriSpesialis.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<KategoriSpesialis>> createKategoriSpesialis({required KategoriSpesialis kategoriSpesialis}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriSpesialis');

    try {
      await documentReference.doc(kategoriSpesialis.id).set(kategoriSpesialis.toJson());
      return Result.success(kategoriSpesialis);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<KategoriSpesialis>> createKategoriSpesialisWithList({required List<KategoriSpesialis> kategoriSpesialisList}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriSpesialis');

    try {
      for (var kategoriSpesialis in kategoriSpesialisList) {
        await documentReference.doc(kategoriSpesialis.id).set(kategoriSpesialis.toJson());
      }
      return Result.success(kategoriSpesialisList.first);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}