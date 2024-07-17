import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';

part 'faskes.freezed.dart';
part 'faskes.g.dart';

@freezed
class Faskes with _$Faskes{
  const factory Faskes({
    required String id,
    required String nama,
    required double jarak,
    required double latitude,
    required double longitude,
    required String alamat,
    required String kategori,
    @Default([]) List<Dokter> listDokter,
    String? gambar,

  }) = _Faskes;

  factory Faskes.fromJson(Map<String, dynamic> json) => _$FaskesFromJson(json);
}