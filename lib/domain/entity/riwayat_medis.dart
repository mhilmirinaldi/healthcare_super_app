import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';

part 'riwayat_medis.freezed.dart';
part 'riwayat_medis.g.dart';

@freezed
class RiwayatMedis with _$RiwayatMedis{
  const factory RiwayatMedis({
    required String id,
    required String idUser,
    required String judul,
    required String tanggal,
    required String dokter,
    required String diagnosis,
    @Default([]) List<Obat> resepObat,
  }) = _RiwayatMedis;

  factory RiwayatMedis.fromJson(Map<String, dynamic> json) => _$RiwayatMedisFromJson(json);
}