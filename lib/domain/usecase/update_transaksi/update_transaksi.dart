import 'package:super_app_telemedicine/data/repository/transaksi_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/update_transaksi/update_transaksi_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class UpdateTransaksi implements UseCase<Result<void>, UpdateTransaksiParam> {
  final TransaksiRepository _transaksiRepository;

  UpdateTransaksi({required TransaksiRepository transaksiRepository})
      : _transaksiRepository = transaksiRepository;

  @override
  Future<Result<void>> call(UpdateTransaksiParam params) async {
    var result =
        await _transaksiRepository.updateTransaksi(transaksi: params.transaksi);

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: final message) => Result.failed(message)
    };
  }
}
