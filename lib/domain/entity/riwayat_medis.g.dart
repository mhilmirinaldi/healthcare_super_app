// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_medis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RiwayatMedisImpl _$$RiwayatMedisImplFromJson(Map<String, dynamic> json) =>
    _$RiwayatMedisImpl(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      judul: json['judul'] as String,
      tanggal: json['tanggal'] as String,
      dokter: json['dokter'] as String,
      diagnosis: json['diagnosis'] as String,
      resepObat: (json['resepObat'] as List<dynamic>?)
              ?.map((e) => Obat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RiwayatMedisImplToJson(_$RiwayatMedisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'judul': instance.judul,
      'tanggal': instance.tanggal,
      'dokter': instance.dokter,
      'diagnosis': instance.diagnosis,
      'resepObat': instance.resepObat,
    };
