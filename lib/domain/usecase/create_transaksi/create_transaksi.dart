
import 'package:super_app_telemedicine/data/repository/transaksi_repository.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi_param.dart';
import 'package:super_app_telemedicine/domain/usecase/usecase.dart';

class CreateTransaksi
    implements UseCase<Result<void>, CreateTransaksiParam> {
  final TransaksiRepository _transaksiRepository;

  CreateTransaksi({required TransaksiRepository transaksiRepository})
      : _transaksiRepository = transaksiRepository;

  @override
  Future<Result<void>> call(CreateTransaksiParam params) async {
    var result = await _transaksiRepository.createTransaksi(
        transaksi: params.transaksi);

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: final message) => Result.failed(message)
    };
  }
}
