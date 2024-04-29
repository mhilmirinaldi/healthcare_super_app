import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';

part 'fasilitas_kesehatan.freezed.dart';
part 'fasilitas_kesehatan.g.dart';

@freezed
class FasilitasKesehatan with _$FasilitasKesehatan{
  const factory FasilitasKesehatan({
    required String id,
    required String nama,
    required String jarak,
    required String alamat,
    required String profil,
    @Default([]) List<Dokter> daftarDokter,
    String? gambar,

  }) = _FasilitasKesehatan;

  factory FasilitasKesehatan.fromJson(Map<String, dynamic> json) => _$FasilitasKesehatanFromJson(json);
}