import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';

part 'transaksi.freezed.dart';
part 'transaksi.g.dart';

@freezed
class Transaksi with _$Transaksi{
  const factory Transaksi({
    required String id,
    required String idUser,
    required String judul,
    required String kategori,
    required int waktuTransaksi,
    required int totalHarga,
    List<Obat>? listObat,
    Dokter? dokter,
    Faskes? faskes,
    String? diagnosa,
  }) = _Transaksi;

  factory Transaksi.fromJson(Map<String, dynamic> json) => _$TransaksiFromJson(json);
}