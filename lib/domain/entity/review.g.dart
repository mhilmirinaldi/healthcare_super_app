// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      idDokter: json['idDokter'] as String,
      user: json['user'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toInt(),
      tanggal: json['tanggal'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idDokter': instance.idDokter,
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
      'tanggal': instance.tanggal,
    };
