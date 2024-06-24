// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaksi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaksi _$TransaksiFromJson(Map<String, dynamic> json) {
  return _Transaksi.fromJson(json);
}

/// @nodoc
mixin _$Transaksi {
  String get id => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  String get judul => throw _privateConstructorUsedError;
  String get kategori => throw _privateConstructorUsedError;
  int get waktuTransaksi => throw _privateConstructorUsedError;
  int get totalHarga => throw _privateConstructorUsedError;
  List<Obat>? get listObat => throw _privateConstructorUsedError;
  Dokter? get dokter => throw _privateConstructorUsedError;
  Faskes? get faskes => throw _privateConstructorUsedError;
  String? get diagnosa => throw _privateConstructorUsedError;
  int? get waktuJanji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransaksiCopyWith<Transaksi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransaksiCopyWith<$Res> {
  factory $TransaksiCopyWith(Transaksi value, $Res Function(Transaksi) then) =
      _$TransaksiCopyWithImpl<$Res, Transaksi>;
  @useResult
  $Res call(
      {String id,
      String idUser,
      String judul,
      String kategori,
      int waktuTransaksi,
      int totalHarga,
      List<Obat>? listObat,
      Dokter? dokter,
      Faskes? faskes,
      String? diagnosa,
      int? waktuJanji});

  $DokterCopyWith<$Res>? get dokter;
  $FaskesCopyWith<$Res>? get faskes;
}

/// @nodoc
class _$TransaksiCopyWithImpl<$Res, $Val extends Transaksi>
    implements $TransaksiCopyWith<$Res> {
  _$TransaksiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? judul = null,
    Object? kategori = null,
    Object? waktuTransaksi = null,
    Object? totalHarga = null,
    Object? listObat = freezed,
    Object? dokter = freezed,
    Object? faskes = freezed,
    Object? diagnosa = freezed,
    Object? waktuJanji = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      kategori: null == kategori
          ? _value.kategori
          : kategori // ignore: cast_nullable_to_non_nullable
              as String,
      waktuTransaksi: null == waktuTransaksi
          ? _value.waktuTransaksi
          : waktuTransaksi // ignore: cast_nullable_to_non_nullable
              as int,
      totalHarga: null == totalHarga
          ? _value.totalHarga
          : totalHarga // ignore: cast_nullable_to_non_nullable
              as int,
      listObat: freezed == listObat
          ? _value.listObat
          : listObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>?,
      dokter: freezed == dokter
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as Dokter?,
      faskes: freezed == faskes
          ? _value.faskes
          : faskes // ignore: cast_nullable_to_non_nullable
              as Faskes?,
      diagnosa: freezed == diagnosa
          ? _value.diagnosa
          : diagnosa // ignore: cast_nullable_to_non_nullable
              as String?,
      waktuJanji: freezed == waktuJanji
          ? _value.waktuJanji
          : waktuJanji // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DokterCopyWith<$Res>? get dokter {
    if (_value.dokter == null) {
      return null;
    }

    return $DokterCopyWith<$Res>(_value.dokter!, (value) {
      return _then(_value.copyWith(dokter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FaskesCopyWith<$Res>? get faskes {
    if (_value.faskes == null) {
      return null;
    }

    return $FaskesCopyWith<$Res>(_value.faskes!, (value) {
      return _then(_value.copyWith(faskes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransaksiImplCopyWith<$Res>
    implements $TransaksiCopyWith<$Res> {
  factory _$$TransaksiImplCopyWith(
          _$TransaksiImpl value, $Res Function(_$TransaksiImpl) then) =
      __$$TransaksiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idUser,
      String judul,
      String kategori,
      int waktuTransaksi,
      int totalHarga,
      List<Obat>? listObat,
      Dokter? dokter,
      Faskes? faskes,
      String? diagnosa,
      int? waktuJanji});

  @override
  $DokterCopyWith<$Res>? get dokter;
  @override
  $FaskesCopyWith<$Res>? get faskes;
}

/// @nodoc
class __$$TransaksiImplCopyWithImpl<$Res>
    extends _$TransaksiCopyWithImpl<$Res, _$TransaksiImpl>
    implements _$$TransaksiImplCopyWith<$Res> {
  __$$TransaksiImplCopyWithImpl(
      _$TransaksiImpl _value, $Res Function(_$TransaksiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? judul = null,
    Object? kategori = null,
    Object? waktuTransaksi = null,
    Object? totalHarga = null,
    Object? listObat = freezed,
    Object? dokter = freezed,
    Object? faskes = freezed,
    Object? diagnosa = freezed,
    Object? waktuJanji = freezed,
  }) {
    return _then(_$TransaksiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      kategori: null == kategori
          ? _value.kategori
          : kategori // ignore: cast_nullable_to_non_nullable
              as String,
      waktuTransaksi: null == waktuTransaksi
          ? _value.waktuTransaksi
          : waktuTransaksi // ignore: cast_nullable_to_non_nullable
              as int,
      totalHarga: null == totalHarga
          ? _value.totalHarga
          : totalHarga // ignore: cast_nullable_to_non_nullable
              as int,
      listObat: freezed == listObat
          ? _value._listObat
          : listObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>?,
      dokter: freezed == dokter
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as Dokter?,
      faskes: freezed == faskes
          ? _value.faskes
          : faskes // ignore: cast_nullable_to_non_nullable
              as Faskes?,
      diagnosa: freezed == diagnosa
          ? _value.diagnosa
          : diagnosa // ignore: cast_nullable_to_non_nullable
              as String?,
      waktuJanji: freezed == waktuJanji
          ? _value.waktuJanji
          : waktuJanji // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransaksiImpl implements _Transaksi {
  const _$TransaksiImpl(
      {required this.id,
      required this.idUser,
      required this.judul,
      required this.kategori,
      required this.waktuTransaksi,
      required this.totalHarga,
      final List<Obat>? listObat,
      this.dokter,
      this.faskes,
      this.diagnosa,
      this.waktuJanji})
      : _listObat = listObat;

  factory _$TransaksiImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransaksiImplFromJson(json);

  @override
  final String id;
  @override
  final String idUser;
  @override
  final String judul;
  @override
  final String kategori;
  @override
  final int waktuTransaksi;
  @override
  final int totalHarga;
  final List<Obat>? _listObat;
  @override
  List<Obat>? get listObat {
    final value = _listObat;
    if (value == null) return null;
    if (_listObat is EqualUnmodifiableListView) return _listObat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Dokter? dokter;
  @override
  final Faskes? faskes;
  @override
  final String? diagnosa;
  @override
  final int? waktuJanji;

  @override
  String toString() {
    return 'Transaksi(id: $id, idUser: $idUser, judul: $judul, kategori: $kategori, waktuTransaksi: $waktuTransaksi, totalHarga: $totalHarga, listObat: $listObat, dokter: $dokter, faskes: $faskes, diagnosa: $diagnosa, waktuJanji: $waktuJanji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransaksiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.judul, judul) || other.judul == judul) &&
            (identical(other.kategori, kategori) ||
                other.kategori == kategori) &&
            (identical(other.waktuTransaksi, waktuTransaksi) ||
                other.waktuTransaksi == waktuTransaksi) &&
            (identical(other.totalHarga, totalHarga) ||
                other.totalHarga == totalHarga) &&
            const DeepCollectionEquality().equals(other._listObat, _listObat) &&
            (identical(other.dokter, dokter) || other.dokter == dokter) &&
            (identical(other.faskes, faskes) || other.faskes == faskes) &&
            (identical(other.diagnosa, diagnosa) ||
                other.diagnosa == diagnosa) &&
            (identical(other.waktuJanji, waktuJanji) ||
                other.waktuJanji == waktuJanji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idUser,
      judul,
      kategori,
      waktuTransaksi,
      totalHarga,
      const DeepCollectionEquality().hash(_listObat),
      dokter,
      faskes,
      diagnosa,
      waktuJanji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransaksiImplCopyWith<_$TransaksiImpl> get copyWith =>
      __$$TransaksiImplCopyWithImpl<_$TransaksiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransaksiImplToJson(
      this,
    );
  }
}

abstract class _Transaksi implements Transaksi {
  const factory _Transaksi(
      {required final String id,
      required final String idUser,
      required final String judul,
      required final String kategori,
      required final int waktuTransaksi,
      required final int totalHarga,
      final List<Obat>? listObat,
      final Dokter? dokter,
      final Faskes? faskes,
      final String? diagnosa,
      final int? waktuJanji}) = _$TransaksiImpl;

  factory _Transaksi.fromJson(Map<String, dynamic> json) =
      _$TransaksiImpl.fromJson;

  @override
  String get id;
  @override
  String get idUser;
  @override
  String get judul;
  @override
  String get kategori;
  @override
  int get waktuTransaksi;
  @override
  int get totalHarga;
  @override
  List<Obat>? get listObat;
  @override
  Dokter? get dokter;
  @override
  Faskes? get faskes;
  @override
  String? get diagnosa;
  @override
  int? get waktuJanji;
  @override
  @JsonKey(ignore: true)
  _$$TransaksiImplCopyWith<_$TransaksiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
