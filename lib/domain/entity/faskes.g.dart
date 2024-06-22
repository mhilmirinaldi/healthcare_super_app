// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faskes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaskesImpl _$$FaskesImplFromJson(Map<String, dynamic> json) => _$FaskesImpl(
      id: json['id'] as String,
      nama: json['nama'] as String,
      jarak: (json['jarak'] as num).toDouble(),
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      alamat: json['alamat'] as String,
      kategori: json['kategori'] as String,
      listDokter: (json['listDokter'] as List<dynamic>?)
              ?.map((e) => Dokter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gambar: json['gambar'] as String?,
    );

Map<String, dynamic> _$$FaskesImplToJson(_$FaskesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'jarak': instance.jarak,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'alamat': instance.alamat,
      'kategori': instance.kategori,
      'listDokter': instance.listDokter,
      'gambar': instance.gambar,
    };
