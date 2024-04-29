// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rekomendasi_dokter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RekomendasiDokter _$RekomendasiDokterFromJson(Map<String, dynamic> json) {
  return _RekomendasiDokter.fromJson(json);
}

/// @nodoc
mixin _$RekomendasiDokter {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get idKategori => throw _privateConstructorUsedError;
  int? get ratingTotal => throw _privateConstructorUsedError;
  int get lamaKerja => throw _privateConstructorUsedError;
  String get harga => throw _privateConstructorUsedError;
  String? get gambar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RekomendasiDokterCopyWith<RekomendasiDokter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RekomendasiDokterCopyWith<$Res> {
  factory $RekomendasiDokterCopyWith(
          RekomendasiDokter value, $Res Function(RekomendasiDokter) then) =
      _$RekomendasiDokterCopyWithImpl<$Res, RekomendasiDokter>;
  @useResult
  $Res call(
      {String id,
      String nama,
      String idKategori,
      int? ratingTotal,
      int lamaKerja,
      String harga,
      String? gambar});
}

/// @nodoc
class _$RekomendasiDokterCopyWithImpl<$Res, $Val extends RekomendasiDokter>
    implements $RekomendasiDokterCopyWith<$Res> {
  _$RekomendasiDokterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? idKategori = null,
    Object? ratingTotal = freezed,
    Object? lamaKerja = null,
    Object? harga = null,
    Object? gambar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      idKategori: null == idKategori
          ? _value.idKategori
          : idKategori // ignore: cast_nullable_to_non_nullable
              as String,
      ratingTotal: freezed == ratingTotal
          ? _value.ratingTotal
          : ratingTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      lamaKerja: null == lamaKerja
          ? _value.lamaKerja
          : lamaKerja // ignore: cast_nullable_to_non_nullable
              as int,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      gambar: freezed == gambar
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RekomendasiDokterImplCopyWith<$Res>
    implements $RekomendasiDokterCopyWith<$Res> {
  factory _$$RekomendasiDokterImplCopyWith(_$RekomendasiDokterImpl value,
          $Res Function(_$RekomendasiDokterImpl) then) =
      __$$RekomendasiDokterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nama,
      String idKategori,
      int? ratingTotal,
      int lamaKerja,
      String harga,
      String? gambar});
}

/// @nodoc
class __$$RekomendasiDokterImplCopyWithImpl<$Res>
    extends _$RekomendasiDokterCopyWithImpl<$Res, _$RekomendasiDokterImpl>
    implements _$$RekomendasiDokterImplCopyWith<$Res> {
  __$$RekomendasiDokterImplCopyWithImpl(_$RekomendasiDokterImpl _value,
      $Res Function(_$RekomendasiDokterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? idKategori = null,
    Object? ratingTotal = freezed,
    Object? lamaKerja = null,
    Object? harga = null,
    Object? gambar = freezed,
  }) {
    return _then(_$RekomendasiDokterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      idKategori: null == idKategori
          ? _value.idKategori
          : idKategori // ignore: cast_nullable_to_non_nullable
              as String,
      ratingTotal: freezed == ratingTotal
          ? _value.ratingTotal
          : ratingTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      lamaKerja: null == lamaKerja
          ? _value.lamaKerja
          : lamaKerja // ignore: cast_nullable_to_non_nullable
              as int,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      gambar: freezed == gambar
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RekomendasiDokterImpl implements _RekomendasiDokter {
  const _$RekomendasiDokterImpl(
      {required this.id,
      required this.nama,
      required this.idKategori,
      this.ratingTotal,
      required this.lamaKerja,
      required this.harga,
      this.gambar});

  factory _$RekomendasiDokterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RekomendasiDokterImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String idKategori;
  @override
  final int? ratingTotal;
  @override
  final int lamaKerja;
  @override
  final String harga;
  @override
  final String? gambar;

  @override
  String toString() {
    return 'RekomendasiDokter(id: $id, nama: $nama, idKategori: $idKategori, ratingTotal: $ratingTotal, lamaKerja: $lamaKerja, harga: $harga, gambar: $gambar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RekomendasiDokterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.idKategori, idKategori) ||
                other.idKategori == idKategori) &&
            (identical(other.ratingTotal, ratingTotal) ||
                other.ratingTotal == ratingTotal) &&
            (identical(other.lamaKerja, lamaKerja) ||
                other.lamaKerja == lamaKerja) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.gambar, gambar) || other.gambar == gambar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nama, idKategori, ratingTotal, lamaKerja, harga, gambar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RekomendasiDokterImplCopyWith<_$RekomendasiDokterImpl> get copyWith =>
      __$$RekomendasiDokterImplCopyWithImpl<_$RekomendasiDokterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RekomendasiDokterImplToJson(
      this,
    );
  }
}

abstract class _RekomendasiDokter implements RekomendasiDokter {
  const factory _RekomendasiDokter(
      {required final String id,
      required final String nama,
      required final String idKategori,
      final int? ratingTotal,
      required final int lamaKerja,
      required final String harga,
      final String? gambar}) = _$RekomendasiDokterImpl;

  factory _RekomendasiDokter.fromJson(Map<String, dynamic> json) =
      _$RekomendasiDokterImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String get idKategori;
  @override
  int? get ratingTotal;
  @override
  int get lamaKerja;
  @override
  String get harga;
  @override
  String? get gambar;
  @override
  @JsonKey(ignore: true)
  _$$RekomendasiDokterImplCopyWith<_$RekomendasiDokterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
