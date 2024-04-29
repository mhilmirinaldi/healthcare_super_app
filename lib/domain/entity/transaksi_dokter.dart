import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaksi_dokter.freezed.dart';
part 'transaksi_dokter.g.dart';

@freezed
class TransaksiDokter with _$TransaksiDokter{
  const factory TransaksiDokter({
    required String id,
    required String idUser,
    required String idDokter,
    required String harga,
    required String waktu,
    required String tanggal,
    required String status,
    String? gambar,

  }) = _TransaksiDokter;

  factory TransaksiDokter.fromJson(Map<String, dynamic> json) => _$TransaksiDokterFromJson(json);
}