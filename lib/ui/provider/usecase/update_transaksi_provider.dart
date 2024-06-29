import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/update_transaksi/update_transaksi.dart';
import 'package:super_app_telemedicine/ui/provider/repository/transaksi_repository/transaksi_repository_provider.dart';

part 'update_transaksi_provider.g.dart';

@riverpod
UpdateTransaksi updateTransaksi(UpdateTransaksiRef ref) =>
    UpdateTransaksi(
        transaksiRepository: ref.watch(transaksiRepositoryProvider));
