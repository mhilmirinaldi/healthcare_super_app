
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_transaksi_repository.dart';
import 'package:super_app_telemedicine/data/repository/transaksi_repository.dart';

part 'transaksi_repository_provider.g.dart';

@riverpod
TransaksiRepository transaksiRepository(TransaksiRepositoryRef ref) =>
    FirebaseTransaksiRepository();
