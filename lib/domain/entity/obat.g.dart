// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObatImpl _$$ObatImplFromJson(Map<String, dynamic> json) => _$ObatImpl(
      id: json['id'] as String,
      idKategori: json['idKategori'] as String,
      nama: json['nama'] as String,
      harga: (json['harga'] as num).toInt(),
      satuan: json['satuan'] as String,
      deskripsi: json['deskripsi'] as String,
      dosis: json['dosis'] as String,
      komposisi: json['komposisi'] as String,
      aturan: json['aturan'] as String,
      gambar: json['gambar'] as String?,
      jumlah: (json['jumlah'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ObatImplToJson(_$ObatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idKategori': instance.idKategori,
      'nama': instance.nama,
      'harga': instance.harga,
      'satuan': instance.satuan,
      'deskripsi': instance.deskripsi,
      'dosis': instance.dosis,
      'komposisi': instance.komposisi,
      'aturan': instance.aturan,
      'gambar': instance.gambar,
      'jumlah': instance.jumlah,
    };
