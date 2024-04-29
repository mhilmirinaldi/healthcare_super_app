import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';

part 'keranjang.freezed.dart';
part 'keranjang.g.dart';

@freezed
class Keranjang with _$Keranjang{
  const factory Keranjang({
    required String id,
    required String idUser,
    required String harga,
    required int jumlah,
    @Default([]) List<Obat> daftarObat,

  }) = _Keranjang;

  factory Keranjang.fromJson(Map<String, dynamic> json) => _$KeranjangFromJson(json);
}