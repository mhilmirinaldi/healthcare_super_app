import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi.dart';
import 'package:super_app_telemedicine/ui/provider/repository/transaksi_repository/transaksi_repository_provider.dart';

part 'create_transaksi_provider.g.dart';

@riverpod
CreateTransaksi createTransaksi(CreateTransaksiRef ref) =>
    CreateTransaksi(
        transaksiRepository: ref.watch(transaksiRepositoryProvider));
