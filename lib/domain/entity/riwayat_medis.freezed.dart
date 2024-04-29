// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'riwayat_medis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RiwayatMedis _$RiwayatMedisFromJson(Map<String, dynamic> json) {
  return _RiwayatMedis.fromJson(json);
}

/// @nodoc
mixin _$RiwayatMedis {
  String get id => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  String get judul => throw _privateConstructorUsedError;
  String get tanggal => throw _privateConstructorUsedError;
  String get dokter => throw _privateConstructorUsedError;
  String get diagnosis => throw _privateConstructorUsedError;
  List<Obat> get resepObat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiwayatMedisCopyWith<RiwayatMedis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiwayatMedisCopyWith<$Res> {
  factory $RiwayatMedisCopyWith(
          RiwayatMedis value, $Res Function(RiwayatMedis) then) =
      _$RiwayatMedisCopyWithImpl<$Res, RiwayatMedis>;
  @useResult
  $Res call(
      {String id,
      String idUser,
      String judul,
      String tanggal,
      String dokter,
      String diagnosis,
      List<Obat> resepObat});
}

/// @nodoc
class _$RiwayatMedisCopyWithImpl<$Res, $Val extends RiwayatMedis>
    implements $RiwayatMedisCopyWith<$Res> {
  _$RiwayatMedisCopyWithImpl(this._value, this._then);

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
    Object? tanggal = null,
    Object? dokter = null,
    Object? diagnosis = null,
    Object? resepObat = null,
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
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      dokter: null == dokter
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosis: null == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String,
      resepObat: null == resepObat
          ? _value.resepObat
          : resepObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiwayatMedisImplCopyWith<$Res>
    implements $RiwayatMedisCopyWith<$Res> {
  factory _$$RiwayatMedisImplCopyWith(
          _$RiwayatMedisImpl value, $Res Function(_$RiwayatMedisImpl) then) =
      __$$RiwayatMedisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idUser,
      String judul,
      String tanggal,
      String dokter,
      String diagnosis,
      List<Obat> resepObat});
}

/// @nodoc
class __$$RiwayatMedisImplCopyWithImpl<$Res>
    extends _$RiwayatMedisCopyWithImpl<$Res, _$RiwayatMedisImpl>
    implements _$$RiwayatMedisImplCopyWith<$Res> {
  __$$RiwayatMedisImplCopyWithImpl(
      _$RiwayatMedisImpl _value, $Res Function(_$RiwayatMedisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? judul = null,
    Object? tanggal = null,
    Object? dokter = null,
    Object? diagnosis = null,
    Object? resepObat = null,
  }) {
    return _then(_$RiwayatMedisImpl(
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
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      dokter: null == dokter
          ? _value.dokter
          : dokter // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosis: null == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String,
      resepObat: null == resepObat
          ? _value._resepObat
          : resepObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiwayatMedisImpl implements _RiwayatMedis {
  const _$RiwayatMedisImpl(
      {required this.id,
      required this.idUser,
      required this.judul,
      required this.tanggal,
      required this.dokter,
      required this.diagnosis,
      final List<Obat> resepObat = const []})
      : _resepObat = resepObat;

  factory _$RiwayatMedisImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiwayatMedisImplFromJson(json);

  @override
  final String id;
  @override
  final String idUser;
  @override
  final String judul;
  @override
  final String tanggal;
  @override
  final String dokter;
  @override
  final String diagnosis;
  final List<Obat> _resepObat;
  @override
  @JsonKey()
  List<Obat> get resepObat {
    if (_resepObat is EqualUnmodifiableListView) return _resepObat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resepObat);
  }

  @override
  String toString() {
    return 'RiwayatMedis(id: $id, idUser: $idUser, judul: $judul, tanggal: $tanggal, dokter: $dokter, diagnosis: $diagnosis, resepObat: $resepObat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiwayatMedisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.judul, judul) || other.judul == judul) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.dokter, dokter) || other.dokter == dokter) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis) &&
            const DeepCollectionEquality()
                .equals(other._resepObat, _resepObat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idUser, judul, tanggal,
      dokter, diagnosis, const DeepCollectionEquality().hash(_resepObat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiwayatMedisImplCopyWith<_$RiwayatMedisImpl> get copyWith =>
      __$$RiwayatMedisImplCopyWithImpl<_$RiwayatMedisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiwayatMedisImplToJson(
      this,
    );
  }
}

abstract class _RiwayatMedis implements RiwayatMedis {
  const factory _RiwayatMedis(
      {required final String id,
      required final String idUser,
      required final String judul,
      required final String tanggal,
      required final String dokter,
      required final String diagnosis,
      final List<Obat> resepObat}) = _$RiwayatMedisImpl;

  factory _RiwayatMedis.fromJson(Map<String, dynamic> json) =
      _$RiwayatMedisImpl.fromJson;

  @override
  String get id;
  @override
  String get idUser;
  @override
  String get judul;
  @override
  String get tanggal;
  @override
  String get dokter;
  @override
  String get diagnosis;
  @override
  List<Obat> get resepObat;
  @override
  @JsonKey(ignore: true)
  _$$RiwayatMedisImplCopyWith<_$RiwayatMedisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
