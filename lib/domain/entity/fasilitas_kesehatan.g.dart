// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fasilitas_kesehatan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FasilitasKesehatanImpl _$$FasilitasKesehatanImplFromJson(
        Map<String, dynamic> json) =>
    _$FasilitasKesehatanImpl(
      id: json['id'] as String,
      nama: json['nama'] as String,
      jarak: json['jarak'] as String,
      alamat: json['alamat'] as String,
      profil: json['profil'] as String,
      daftarDokter: (json['daftarDokter'] as List<dynamic>?)
              ?.map((e) => Dokter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gambar: json['gambar'] as String?,
    );

Map<String, dynamic> _$$FasilitasKesehatanImplToJson(
        _$FasilitasKesehatanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'jarak': instance.jarak,
      'alamat': instance.alamat,
      'profil': instance.profil,
      'daftarDokter': instance.daftarDokter,
      'gambar': instance.gambar,
    };
