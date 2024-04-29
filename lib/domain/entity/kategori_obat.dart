import 'package:freezed_annotation/freezed_annotation.dart';

part 'kategori_obat.freezed.dart';
part 'kategori_obat.g.dart';

@freezed
class KategoriObat with _$KategoriObat {
  const factory KategoriObat({
    required String id,
    required String nama,
    String? icon,
  }) = _KategoriObat;

  factory KategoriObat.fromJson(Map<String, dynamic> json) =>
      _$KategoriObatFromJson(json);
}
