// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keranjang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeranjangImpl _$$KeranjangImplFromJson(Map<String, dynamic> json) =>
    _$KeranjangImpl(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      harga: json['harga'] as String,
      jumlah: (json['jumlah'] as num).toInt(),
      daftarObat: (json['daftarObat'] as List<dynamic>?)
              ?.map((e) => Obat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$KeranjangImplToJson(_$KeranjangImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'harga': instance.harga,
      'jumlah': instance.jumlah,
      'daftarObat': instance.daftarObat,
    };
