import 'package:super_app_telemedicine/data/repository/kategori_dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseKategoriDokterRepository implements KategoriDokterRepository{
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseKategoriDokterRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<KategoriDokter>>> getKategoriDokter() async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriDokter');

    try {
      var result = await documentReference.get();

      if(result.docs.isNotEmpty){
        return Result.success(result.docs.map((e) => KategoriDokter.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<KategoriDokter>> createKategoriDokter({required KategoriDokter kategoriDokter}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference = _firebaseFirestore.collection('kategoriDokter');

    try {
      await documentReference.doc(kategoriDokter.id).set(kategoriDokter.toJson());
      return Result.success(kategoriDokter);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}