import 'package:super_app_telemedicine/data/repository/kategori_obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseKategoriObatRepository implements KategoriObatRepository{
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseKategoriObatRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<KategoriObat>>> getKategoriObat() async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriObat');

    try {
      var result = await documentReference.get();

      if(result.docs.isNotEmpty){
        return Result.success(result.docs.map((e) => KategoriObat.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<KategoriObat>> createKategoriObat({required KategoriObat kategoriObat}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriObat');

    try {
      // set id
      await documentReference.doc(kategoriObat.id).set(kategoriObat.toJson());
      return Result.success(kategoriObat);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<KategoriObat>> createKategoriObatWithList({required List<KategoriObat> kategoriObatList}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriObat');

    try {
      for (var kategoriObat in kategoriObatList) {
        await documentReference.doc(kategoriObat.id).set(kategoriObat.toJson());
      }
      return Result.success(kategoriObatList.first);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}