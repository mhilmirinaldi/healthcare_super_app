import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

class FirebaseObatRepository implements ObatRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseObatRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<Obat>>> getObatByKategori(
      {required String idKategori}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('obat');

    try {
      var result = await documentReference
          .where('idKategori', isEqualTo: idKategori)
          .get();

      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => Obat.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Obat>> getObatDetail({required String id}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('obat');

    try {
      var result = await documentReference.where('id', isEqualTo: id).get();

      if (result.docs.isNotEmpty) {
        return Result.success(Obat.fromJson(result.docs.first.data()));
      } else {
        return const Result.failed('Obat not found');
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
Future<Result<List<Obat>>> getRekomendasiObat() async {
  firestore.CollectionReference<Map<String, dynamic>> documentReference =
      _firebaseFirestore.collection('obat');

  try {
    var result = await documentReference.get();

    if (result.docs.isNotEmpty) {
      List<Obat> selectedObats = [];
      List<int> indices = [0, 18, 9, 3, 17];
      
      for (int index in indices) {
        if (index < result.docs.length) {
          selectedObats.add(Obat.fromJson(result.docs[index].data()));
        }
      }

      return Result.success(selectedObats);
    } else {
      return const Result.success([]);
    }
  } catch (e) {
    return Result.failed(e.toString());
  }
}


  @override
  Future<Result<List<Obat>>> searchObat(String query) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('obat');

    try {
      var result = await documentReference.get();

      if (result.docs.isNotEmpty) {
        var filteredResults = result.docs
            .where((doc) {
              var data = doc.data();
              var nama = data['nama'].toString().toLowerCase();
              var lowerCaseQuery = query.toLowerCase();
              return nama.contains(lowerCaseQuery);
            })
            .map((e) => Obat.fromJson(e.data()))
            .toList();

        return Result.success(filteredResults);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Obat>>> searchObatWithKategori(
      String query, String idKategori) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('obat');

    try {
      var result = await documentReference
          .where('idKategori', isEqualTo: idKategori)
          .get();

      if (result.docs.isNotEmpty) {
        var filteredResults = result.docs
            .where((doc) {
              var data = doc.data();
              var nama = data['nama'].toString().toLowerCase();
              var lowerCaseQuery = query.toLowerCase();
              return nama.contains(lowerCaseQuery);
            })
            .map((e) => Obat.fromJson(e.data()))
            .toList();

        return Result.success(filteredResults);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<Obat>> createObatWithList({required List<Obat> obatList}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('obat');

    try {
      for (var obat in obatList) {
        await documentReference.doc(obat.id).set(obat.toJson());
      }
      return Result.success(obatList.first);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<List<Obat>>> getResepObat() async {
  firestore.CollectionReference<Map<String, dynamic>> documentReference =
      _firebaseFirestore.collection('obat');

  try {
    var result = await documentReference.get();

    if (result.docs.isNotEmpty) {
      List<Obat> selectedObats = [];
      List<int> indices = [18, 19];
      
      for (int index in indices) {
        if (index < result.docs.length) {
          selectedObats.add(Obat.fromJson(result.docs[index].data()));
        }
      }

      return Result.success(selectedObats);
    } else {
      return const Result.success([]);
    }
  } catch (e) {
    return Result.failed(e.toString());
  }
}
}
