// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keranjang.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Keranjang _$KeranjangFromJson(Map<String, dynamic> json) {
  return _Keranjang.fromJson(json);
}

/// @nodoc
mixin _$Keranjang {
  String get id => throw _privateConstructorUsedError;
  String get idUser => throw _privateConstructorUsedError;
  String get harga => throw _privateConstructorUsedError;
  int get jumlah => throw _privateConstructorUsedError;
  List<Obat> get daftarObat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeranjangCopyWith<Keranjang> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeranjangCopyWith<$Res> {
  factory $KeranjangCopyWith(Keranjang value, $Res Function(Keranjang) then) =
      _$KeranjangCopyWithImpl<$Res, Keranjang>;
  @useResult
  $Res call(
      {String id,
      String idUser,
      String harga,
      int jumlah,
      List<Obat> daftarObat});
}

/// @nodoc
class _$KeranjangCopyWithImpl<$Res, $Val extends Keranjang>
    implements $KeranjangCopyWith<$Res> {
  _$KeranjangCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? harga = null,
    Object? jumlah = null,
    Object? daftarObat = null,
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
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      jumlah: null == jumlah
          ? _value.jumlah
          : jumlah // ignore: cast_nullable_to_non_nullable
              as int,
      daftarObat: null == daftarObat
          ? _value.daftarObat
          : daftarObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeranjangImplCopyWith<$Res>
    implements $KeranjangCopyWith<$Res> {
  factory _$$KeranjangImplCopyWith(
          _$KeranjangImpl value, $Res Function(_$KeranjangImpl) then) =
      __$$KeranjangImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idUser,
      String harga,
      int jumlah,
      List<Obat> daftarObat});
}

/// @nodoc
class __$$KeranjangImplCopyWithImpl<$Res>
    extends _$KeranjangCopyWithImpl<$Res, _$KeranjangImpl>
    implements _$$KeranjangImplCopyWith<$Res> {
  __$$KeranjangImplCopyWithImpl(
      _$KeranjangImpl _value, $Res Function(_$KeranjangImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idUser = null,
    Object? harga = null,
    Object? jumlah = null,
    Object? daftarObat = null,
  }) {
    return _then(_$KeranjangImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      harga: null == harga
          ? _value.harga
          : harga // ignore: cast_nullable_to_non_nullable
              as String,
      jumlah: null == jumlah
          ? _value.jumlah
          : jumlah // ignore: cast_nullable_to_non_nullable
              as int,
      daftarObat: null == daftarObat
          ? _value._daftarObat
          : daftarObat // ignore: cast_nullable_to_non_nullable
              as List<Obat>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeranjangImpl implements _Keranjang {
  const _$KeranjangImpl(
      {required this.id,
      required this.idUser,
      required this.harga,
      required this.jumlah,
      final List<Obat> daftarObat = const []})
      : _daftarObat = daftarObat;

  factory _$KeranjangImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeranjangImplFromJson(json);

  @override
  final String id;
  @override
  final String idUser;
  @override
  final String harga;
  @override
  final int jumlah;
  final List<Obat> _daftarObat;
  @override
  @JsonKey()
  List<Obat> get daftarObat {
    if (_daftarObat is EqualUnmodifiableListView) return _daftarObat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daftarObat);
  }

  @override
  String toString() {
    return 'Keranjang(id: $id, idUser: $idUser, harga: $harga, jumlah: $jumlah, daftarObat: $daftarObat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeranjangImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.harga, harga) || other.harga == harga) &&
            (identical(other.jumlah, jumlah) || other.jumlah == jumlah) &&
            const DeepCollectionEquality()
                .equals(other._daftarObat, _daftarObat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idUser, harga, jumlah,
      const DeepCollectionEquality().hash(_daftarObat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeranjangImplCopyWith<_$KeranjangImpl> get copyWith =>
      __$$KeranjangImplCopyWithImpl<_$KeranjangImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeranjangImplToJson(
      this,
    );
  }
}

abstract class _Keranjang implements Keranjang {
  const factory _Keranjang(
      {required final String id,
      required final String idUser,
      required final String harga,
      required final int jumlah,
      final List<Obat> daftarObat}) = _$KeranjangImpl;

  factory _Keranjang.fromJson(Map<String, dynamic> json) =
      _$KeranjangImpl.fromJson;

  @override
  String get id;
  @override
  String get idUser;
  @override
  String get harga;
  @override
  int get jumlah;
  @override
  List<Obat> get daftarObat;
  @override
  @JsonKey(ignore: true)
  _$$KeranjangImplCopyWith<_$KeranjangImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
