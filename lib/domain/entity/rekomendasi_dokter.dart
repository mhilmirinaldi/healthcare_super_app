
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rekomendasi_dokter.freezed.dart';
part 'rekomendasi_dokter.g.dart';

@freezed
class RekomendasiDokter with _$RekomendasiDokter {
  const factory RekomendasiDokter({
    required String id,
    required String nama,
    required String idKategori,
    int? ratingTotal,
    required int lamaKerja,
    required int harga,
    String? gambar,
  }) = _RekomendasiDokter;

  factory RekomendasiDokter.fromJson(Map<String, dynamic> json) =>
      _$RekomendasiDokterFromJson(json);
}
