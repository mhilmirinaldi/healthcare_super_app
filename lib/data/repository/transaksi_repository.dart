

import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';

abstract interface class TransaksiRepository {
  Future<Result<Transaksi>> createTransaksi({required Transaksi transaksi});
  Future<Result<List<Transaksi>>> getUserTransaksis({required String idUser});
}
