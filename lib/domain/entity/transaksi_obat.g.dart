// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_obat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransaksiObatImpl _$$TransaksiObatImplFromJson(Map<String, dynamic> json) =>
    _$TransaksiObatImpl(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      daftarObat: (json['daftarObat'] as List<dynamic>?)
              ?.map((e) => Obat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      harga: json['harga'] as String,
      waktu: json['waktu'] as String,
      tanggal: json['tanggal'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TransaksiObatImplToJson(_$TransaksiObatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'daftarObat': instance.daftarObat,
      'harga': instance.harga,
      'waktu': instance.waktu,
      'tanggal': instance.tanggal,
      'status': instance.status,
    };
