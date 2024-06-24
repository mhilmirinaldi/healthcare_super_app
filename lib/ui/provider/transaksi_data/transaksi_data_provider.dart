import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';
import 'package:super_app_telemedicine/domain/usecase/get_transaksi/get_transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/get_transaksi/get_transaksi_param.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_transaksi_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

part 'transaksi_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransaksiData extends _$TransaksiData {
  @override
  Future<List<Transaksi>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaksi getTransaksi = ref.read(getTransaksiProvider);

      var result = await getTransaksi(GetTransaksiParam(idUser: user.id));

      if (result case Success(value: final transaksi)) {
        return transaksi;
      }
    }

    return const [];
  }

  Future<void> refreshTransaksiData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaksi getTransaksi = ref.read(getTransaksiProvider);

      var result = await getTransaksi(GetTransaksiParam(idUser: user.id));

      switch (result) {
        case Success(value: final transaksi):
          state = AsyncData(transaksi);
        case Failed(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
