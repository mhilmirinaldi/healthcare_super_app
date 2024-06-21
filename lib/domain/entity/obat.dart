import 'package:freezed_annotation/freezed_annotation.dart';

part 'obat.freezed.dart';
part 'obat.g.dart';

@freezed
class Obat with _$Obat {
  const factory Obat({
    required String id,
    required String idKategori,
    required String nama,
    required String harga,
    required String satuan,
    required String deskripsi,
    required String dosis,
    required String komposisi,
    required String aturan,
    String? gambar,
    @Default(0) int? jumlah,
  }) = _Obat;

  factory Obat.fromJson(Map<String, dynamic> json) => _$ObatFromJson(json);
}
