import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:super_app_telemedicine/data/repository/transaksi_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';

class FirebaseTransaksiRepository implements TransaksiRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransaksiRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaksi>> createTransaksi(
      {required Transaksi transaksi}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('transaksi');

    try {
      if (transaksi.listObat != null) {
        List<Map<String, dynamic>> obatListJson =
            transaksi.listObat!.map((obat) {
          var obatJson = obat.toJson();

          return obatJson;
        }).toList();

        var transaksiJson = transaksi.toJson();
        transaksiJson.remove('listObat');

        transaksiJson['listObat'] = obatListJson;

        await documentReference.doc(transaksi.id).set(transaksiJson);
      }

      if (transaksi.dokter != null) {
        List<Map<String, dynamic>> reviewListJson =
            transaksi.dokter!.review.map((review) => review.toJson()).toList();

        var dokterJson = transaksi.dokter!.toJson();
        dokterJson.remove('review');
        dokterJson['review'] = reviewListJson;
        
        var transaksiJson = transaksi.toJson();
        transaksiJson.remove('dokter');

        transaksiJson['dokter'] = dokterJson;

        await documentReference.doc(transaksi.id).set(transaksiJson);
      }

      if (transaksi.listObat == null &&
          transaksi.dokter == null &&
          transaksi.faskes == null) {
        await documentReference.doc(transaksi.id).set(transaksi.toJson());
      }
      return Result.success(transaksi);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Transaksi>>> getUserTransaksi(
      {required String idUser}) async {
    firestore.CollectionReference<Map<String, dynamic>> transaksi =
        _firebaseFirestore.collection('transaksi');

    try {
      var result = await transaksi.where('idUser', isEqualTo: idUser).get();

      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => Transaksi.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
