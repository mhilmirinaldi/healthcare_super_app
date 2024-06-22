import 'package:freezed_annotation/freezed_annotation.dart';

part 'kategori_spesialis.freezed.dart';
part 'kategori_spesialis.g.dart';

@freezed
class KategoriSpesialis with _$KategoriSpesialis{
  const factory KategoriSpesialis({
    required String id,
    required String name,
    String? icon,
  }) = _KategoriSpesialis;

  factory KategoriSpesialis.fromJson(Map<String, dynamic> json) => _$KategoriSpesialisFromJson(json);
}