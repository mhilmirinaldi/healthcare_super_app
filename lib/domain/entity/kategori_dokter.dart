
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kategori_dokter.freezed.dart';
part 'kategori_dokter.g.dart';

@freezed
class KategoriDokter with _$KategoriDokter{
  const factory KategoriDokter({
    required String id,
    required String nama,
    String? icon,
  }) = _KategoriDokter;

  factory KategoriDokter.fromJson(Map<String, dynamic> json) => _$KategoriDokterFromJson(json);
}