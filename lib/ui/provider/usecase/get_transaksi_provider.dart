import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/usecase/get_transaksi/get_transaksi.dart';
import 'package:super_app_telemedicine/ui/provider/repository/transaksi_repository/transaksi_repository_provider.dart';

part 'get_transaksi_provider.g.dart';

@riverpod
GetTransaksi getTransaksi(GetTransaksiRef ref) => GetTransaksi(
    transaksiRepository: ref.watch(transaksiRepositoryProvider));
