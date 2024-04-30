// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dokter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DokterImpl _$$DokterImplFromJson(Map<String, dynamic> json) => _$DokterImpl(
      id: json['id'] as String,
      nama: json['nama'] as String,
      idKategori: json['idKategori'] as String,
      lamaKerja: (json['lamaKerja'] as num).toInt(),
      alumnus: json['alumnus'] as String,
      tempatPraktik: json['tempatPraktik'] as String,
      ratingTotal: (json['ratingTotal'] as num?)?.toInt(),
      review: (json['review'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      harga: (json['harga'] as num).toInt(),
      gambar: json['gambar'] as String?,
    );

Map<String, dynamic> _$$DokterImplToJson(_$DokterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'idKategori': instance.idKategori,
      'lamaKerja': instance.lamaKerja,
      'alumnus': instance.alumnus,
      'tempatPraktik': instance.tempatPraktik,
      'ratingTotal': instance.ratingTotal,
      'review': instance.review,
      'harga': instance.harga,
      'gambar': instance.gambar,
    };
