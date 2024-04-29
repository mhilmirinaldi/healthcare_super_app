// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaksi_obat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransaksiObat _$TransaksiObatFromJson(Map<String, dynamic> json) {
  return _TransaksiObat.fromJson(json);
}

/// @nodoc
mixin _$TransaksiObat {
  String get id => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  List<Obat> get daftarObat => throw _privateConstructorUsedError;
  String get harga => throw _privateConstructorUsedError;
  String get waktu => throw _privateConstructorUsedError;
  String get tanggal => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransaksiObatCopyWith<TransaksiObat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransaksiObatCopyWith<$Res> {
  factory $TransaksiObatCopyWith(
          TransaksiObat value, $Res Function(TransaksiObat) then) =
      _$TransaksiObatCopyWithImpl<$Res, TransaksiObat>;
  @useResult
  $Res call(
      {String id,
      String idUser,
      List<Obat> daftarObat,
      String harga,
      String waktu,
      String tanggal,
      String status});
}

/// @nodoc
class _$TransaksiObatCopyWithImpl<$Res, $Val extends TransaksiObat>
    implements $TransaksiObatCopyWith<$Res> {
  _$TransaksiObatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? daftarObat = null,
    Object? harga = null,
    Object? waktu = null,
    Object? tanggal = null,
    Object? status = null,
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
      daftarObat: null == daftarObat
          ? _value.daftarObat
          : daftarObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      waktu: null == waktu
          ? _value.waktu
          : waktu // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransaksiObatImplCopyWith<$Res>
    implements $TransaksiObatCopyWith<$Res> {
  factory _$$TransaksiObatImplCopyWith(
          _$TransaksiObatImpl value, $Res Function(_$TransaksiObatImpl) then) =
      __$$TransaksiObatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idUser,
      List<Obat> daftarObat,
      String harga,
      String waktu,
      String tanggal,
      String status});
}

/// @nodoc
class __$$TransaksiObatImplCopyWithImpl<$Res>
    extends _$TransaksiObatCopyWithImpl<$Res, _$TransaksiObatImpl>
    implements _$$TransaksiObatImplCopyWith<$Res> {
  __$$TransaksiObatImplCopyWithImpl(
      _$TransaksiObatImpl _value, $Res Function(_$TransaksiObatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? daftarObat = null,
    Object? harga = null,
    Object? waktu = null,
    Object? tanggal = null,
    Object? status = null,
  }) {
    return _then(_$TransaksiObatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      daftarObat: null == daftarObat
          ? _value._daftarObat
          : daftarObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      waktu: null == waktu
          ? _value.waktu
          : waktu // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransaksiObatImpl implements _TransaksiObat {
  const _$TransaksiObatImpl(
      {required this.id,
      required this.idUser,
      final List<Obat> daftarObat = const [],
      required this.harga,
      required this.waktu,
      required this.tanggal,
      required this.status})
      : _daftarObat = daftarObat;

  factory _$TransaksiObatImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransaksiObatImplFromJson(json);

  @override
  final String id;
  @override
  final String idUser;
  final List<Obat> _daftarObat;
  @override
  @JsonKey()
  List<Obat> get daftarObat {
    if (_daftarObat is EqualUnmodifiableListView) return _daftarObat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daftarObat);
  }

  @override
  final String harga;
  @override
  final String waktu;
  @override
  final String tanggal;
  @override
  final String status;

  @override
  String toString() {
    return 'TransaksiObat(id: $id, idUser: $idUser, daftarObat: $daftarObat, harga: $harga, waktu: $waktu, tanggal: $tanggal, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransaksiObatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            const DeepCollectionEquality()
                .equals(other._daftarObat, _daftarObat) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.waktu, waktu) || other.waktu == waktu) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idUser,
      const DeepCollectionEquality().hash(_daftarObat),
      harga,
      waktu,
      tanggal,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransaksiObatImplCopyWith<_$TransaksiObatImpl> get copyWith =>
      __$$TransaksiObatImplCopyWithImpl<_$TransaksiObatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransaksiObatImplToJson(
      this,
    );
  }
}

abstract class _TransaksiObat implements TransaksiObat {
  const factory _TransaksiObat(
      {required final String id,
      required final String idUser,
      final List<Obat> daftarObat,
      required final String harga,
      required final String waktu,
      required final String tanggal,
      required final String status}) = _$TransaksiObatImpl;

  factory _TransaksiObat.fromJson(Map<String, dynamic> json) =
      _$TransaksiObatImpl.fromJson;

  @override
  String get id;
  @override
  String get idUser;
  @override
  List<Obat> get daftarObat;
  @override
  String get harga;
  @override
  String get waktu;
  @override
  String get tanggal;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$TransaksiObatImplCopyWith<_$TransaksiObatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
