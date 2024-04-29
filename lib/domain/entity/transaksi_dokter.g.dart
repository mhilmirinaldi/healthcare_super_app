// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_dokter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransaksiDokterImpl _$$TransaksiDokterImplFromJson(
        Map<String, dynamic> json) =>
    _$TransaksiDokterImpl(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      idDokter: json['idDokter'] as String,
      harga: json['harga'] as String,
      waktu: json['waktu'] as String,
      tanggal: json['tanggal'] as String,
      status: json['status'] as String,
      gambar: json['gambar'] as String?,
    );

Map<String, dynamic> _$$TransaksiDokterImplToJson(
        _$TransaksiDokterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'idDokter': instance.idDokter,
      'harga': instance.harga,
      'waktu': instance.waktu,
      'tanggal': instance.tanggal,
      'status': instance.status,
      'gambar': instance.gambar,
    };
