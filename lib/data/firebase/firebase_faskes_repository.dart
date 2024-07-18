import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';

class FirebaseFaskesRepository implements FaskesRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseFaskesRepository({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<Faskes>>> getFaskesByKategori(
      {required String idKategori}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference
          .where('idKategori', isEqualTo: idKategori)
          .get();

      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => Faskes.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<Faskes>> getFaskesDetail({required String id}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference.where('id', isEqualTo: id).get();

      if (result.docs.isNotEmpty) {
        return Result.success(Faskes.fromJson(result.docs.first.data()));
      } else {
        return const Result.failed('Faskes not found');
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Faskes>>> getRekomendasiFaskes() async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference.get();

      if (result.docs.isNotEmpty) {
        List<Faskes> selectedFaskess = [];
        List<int> indices = [2, 0, 3, 1, 9];

        for (int index in indices) {
          if (index < result.docs.length) {
            selectedFaskess.add(Faskes.fromJson(result.docs[index].data()));
          }
        }

        return Result.success(selectedFaskess);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Faskes>>> searchFaskes(String query) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference.get();

      if (result.docs.isNotEmpty) {
        var filteredResults = result.docs
            .where((doc) {
              var data = doc.data();
              var nama = data['nama'].toString().toLowerCase();
              var kategori = data['kategori'].toString().toLowerCase();
              var lowerCaseQuery = query.toLowerCase();
              return nama.contains(lowerCaseQuery) ||
                  kategori.contains(lowerCaseQuery);
            })
            .map((e) => Faskes.fromJson(e.data()))
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
  Future<Result<List<Faskes>>> searchFaskesWithKategori(
      String query, String idKategori) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

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
            .map((e) => Faskes.fromJson(e.data()))
            .toList();

        return Result.success(filteredResults);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<Faskes>> createFaskesWithList(
      {required List<Faskes> faskesList}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      for (var faskes in faskesList) {
        // Convert listDokter to List<Map<String, dynamic>>
        List<Map<String, dynamic>> dokterListJson =
            faskes.listDokter.map((dokter) {
          // Convert review to List<Map<String, dynamic>>
          List<Map<String, dynamic>> reviewListJson =
              dokter.review.map((review) => review.toJson()).toList();

          // Create a copy of Dokter without review to avoid circular reference issue
          var dokterJson = dokter.toJson();
          dokterJson.remove('review');

          // Add review as a separate field
          dokterJson['review'] = reviewListJson;

          return dokterJson;
        }).toList();

        // Create a copy of Faskes without listDokter to avoid circular reference issue
        var faskesJson = faskes.toJson();
        faskesJson.remove('listDokter');

        // Add listDokter as a separate field
        faskesJson['listDokter'] = dokterListJson;

        await documentReference.doc(faskes.id).set(faskesJson);
      }
      return Result.success(faskesList.first);
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Dokter>>> getDokterFaskesByKategori(
      {required String idKategori}) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference.get();

      if (result.docs.isNotEmpty) {
        List<Dokter> dokters = [];
        for (var doc in result.docs) {
          var data = doc.data();
          var listDokter = data['listDokter'] as List;
          for (var dokter in listDokter) {
            if (dokter['idKategori'] == idKategori) {
              dokters.add(Dokter.fromJson(dokter));
            }
          }
        }
        return Result.success(dokters);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<List<Dokter>>> searchDokterFaskesWithKategori(
      String query, String idKategori) async {
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference.get();

      if (result.docs.isNotEmpty) {
        List<Dokter> dokters = [];
        for (var doc in result.docs) {
          var data = doc.data();
          var listDokter = data['listDokter'] as List;
          for (var dokter in listDokter) {
            if (dokter['idKategori'] == idKategori) {
              dokters.add(Dokter.fromJson(dokter));
            }
          }
        }

        dokters = dokters.where((dokter) {
          var nama = dokter.nama.toLowerCase();
          var faskes = dokter.tempatPraktik.toLowerCase();
          var lowerCaseQuery = query.toLowerCase();
          return nama.contains(lowerCaseQuery) ||
              faskes.contains(lowerCaseQuery);
        }).toList();

        return Result.success(dokters);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<double>> searchJarakByFaskes({required String namaFaskes}) async{
    firestore.CollectionReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.collection('faskes');

    try {
      var result = await documentReference
          .where('nama', isEqualTo: namaFaskes)
          .get();

      if (result.docs.isNotEmpty) {
        return Result.success(result.docs.first.data()['jarak'] as double);
      } else {
        return const Result.success(0.0);
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
