import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';

part 'transaksi_obat.freezed.dart';
part 'transaksi_obat.g.dart';

@freezed
class TransaksiObat with _$TransaksiObat{
  const factory TransaksiObat({
    required String id,
    required String idUser,
    @Default([]) List<Obat> daftarObat,
    required String harga,
    required String waktu,
    required String tanggal,
    required String status,
  }) = _TransaksiObat;

  factory TransaksiObat.fromJson(Map<String, dynamic> json) => _$TransaksiObatFromJson(json);
}