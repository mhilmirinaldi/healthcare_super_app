

import 'package:super_app_telemedicine/data/repository/transaksi_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/get_transaksi/get_transaksi_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class GetTransaksi
    implements UseCase<Result<List<Transaksi>>, GetTransaksiParam> {
  final TransaksiRepository _transaksiRepository;

  GetTransaksi({required TransaksiRepository transaksiRepository})
      : _transaksiRepository = transaksiRepository;

  @override
  Future<Result<List<Transaksi>>> call(GetTransaksiParam params) async {
    var transaksiListResult =
        await _transaksiRepository.getUserTransaksi(idUser: params.idUser);

    return switch (transaksiListResult) {
      Success(value: final transaksiList) => Result.success(transaksiList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
