// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rekomendasi_dokter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RekomendasiDokterImpl _$$RekomendasiDokterImplFromJson(
        Map<String, dynamic> json) =>
    _$RekomendasiDokterImpl(
      id: json['id'] as String,
      nama: json['nama'] as String,
      idKategori: json['idKategori'] as String,
      ratingTotal: (json['ratingTotal'] as num?)?.toInt(),
      lamaKerja: (json['lamaKerja'] as num).toInt(),
      harga: json['harga'] as String,
      gambar: json['gambar'] as String?,
    );

Map<String, dynamic> _$$RekomendasiDokterImplToJson(
        _$RekomendasiDokterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'idKategori': instance.idKategori,
      'ratingTotal': instance.ratingTotal,
      'lamaKerja': instance.lamaKerja,
      'harga': instance.harga,
      'gambar': instance.gambar,
    };
