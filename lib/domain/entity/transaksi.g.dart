// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransaksiImpl _$$TransaksiImplFromJson(Map<String, dynamic> json) =>
    _$TransaksiImpl(
      id: json['id'] as String,
      idUser: json['idUser'] as String,
      judul: json['judul'] as String,
      kategori: json['kategori'] as String,
      waktuTransaksi: (json['waktuTransaksi'] as num).toInt(),
      totalHarga: (json['totalHarga'] as num).toInt(),
      listObat: (json['listObat'] as List<dynamic>?)
          ?.map((e) => Obat.fromJson(e as Map<String, dynamic>))
          .toList(),
      dokter: json['dokter'] == null
          ? null
          : Dokter.fromJson(json['dokter'] as Map<String, dynamic>),
      faskes: json['faskes'] == null
          ? null
          : Faskes.fromJson(json['faskes'] as Map<String, dynamic>),
      diagnosa: json['diagnosa'] as String?,
      waktuJanji: (json['waktuJanji'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransaksiImplToJson(_$TransaksiImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'judul': instance.judul,
      'kategori': instance.kategori,
      'waktuTransaksi': instance.waktuTransaksi,
      'totalHarga': instance.totalHarga,
      'listObat': instance.listObat,
      'dokter': instance.dokter,
      'faskes': instance.faskes,
      'diagnosa': instance.diagnosa,
      'waktuJanji': instance.waktuJanji,
    };
