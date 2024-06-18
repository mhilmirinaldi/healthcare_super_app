import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/review.dart';

part 'dokter.freezed.dart';
part 'dokter.g.dart';

@freezed
class Dokter with _$Dokter{
  const factory Dokter({
    required String id,
    required String nama,
    required String idKategori,
    required int lamaKerja,
    required String alumnus,
    required String tempatPraktik,
    double? ratingTotal,
    @Default([]) List<Review> review,
    required int harga,
    String? gambar,
  }) = _Dokter;

  factory Dokter.fromJson(Map<String, dynamic> json) => _$DokterFromJson(json);
}