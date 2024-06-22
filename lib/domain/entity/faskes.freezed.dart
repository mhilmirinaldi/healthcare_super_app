// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faskes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Faskes _$FaskesFromJson(Map<String, dynamic> json) {
  return _Faskes.fromJson(json);
}

/// @nodoc
mixin _$Faskes {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  double get jarak => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  String get kategori => throw _privateConstructorUsedError;
  List<Dokter> get listDokter => throw _privateConstructorUsedError;
  String? get gambar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaskesCopyWith<Faskes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaskesCopyWith<$Res> {
  factory $FaskesCopyWith(Faskes value, $Res Function(Faskes) then) =
      _$FaskesCopyWithImpl<$Res, Faskes>;
  @useResult
  $Res call(
      {String id,
      String nama,
      double jarak,
      String latitude,
      String longitude,
      String alamat,
      String kategori,
      List<Dokter> listDokter,
      String? gambar});
}

/// @nodoc
class _$FaskesCopyWithImpl<$Res, $Val extends Faskes>
    implements $FaskesCopyWith<$Res> {
  _$FaskesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? jarak = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? alamat = null,
    Object? kategori = null,
    Object? listDokter = null,
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
      jarak: null == jarak
          ? _value.jarak
          : jarak // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      kategori: null == kategori
          ? _value.kategori
          : kategori // ignore: cast_nullable_to_non_nullable
              as String,
      listDokter: null == listDokter
          ? _value.listDokter
          : listDokter // ignore: cast_nullable_to_non_nullable
              as List<Dokter>,
      gambar: freezed == gambar
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaskesImplCopyWith<$Res> implements $FaskesCopyWith<$Res> {
  factory _$$FaskesImplCopyWith(
          _$FaskesImpl value, $Res Function(_$FaskesImpl) then) =
      __$$FaskesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nama,
      double jarak,
      String latitude,
      String longitude,
      String alamat,
      String kategori,
      List<Dokter> listDokter,
      String? gambar});
}

/// @nodoc
class __$$FaskesImplCopyWithImpl<$Res>
    extends _$FaskesCopyWithImpl<$Res, _$FaskesImpl>
    implements _$$FaskesImplCopyWith<$Res> {
  __$$FaskesImplCopyWithImpl(
      _$FaskesImpl _value, $Res Function(_$FaskesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? jarak = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? alamat = null,
    Object? kategori = null,
    Object? listDokter = null,
    Object? gambar = freezed,
  }) {
    return _then(_$FaskesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      jarak: null == jarak
          ? _value.jarak
          : jarak // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      kategori: null == kategori
          ? _value.kategori
          : kategori // ignore: cast_nullable_to_non_nullable
              as String,
      listDokter: null == listDokter
          ? _value._listDokter
          : listDokter // ignore: cast_nullable_to_non_nullable
              as List<Dokter>,
      gambar: freezed == gambar
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaskesImpl implements _Faskes {
  const _$FaskesImpl(
      {required this.id,
      required this.nama,
      required this.jarak,
      required this.latitude,
      required this.longitude,
      required this.alamat,
      required this.kategori,
      final List<Dokter> listDokter = const [],
      this.gambar})
      : _listDokter = listDokter;

  factory _$FaskesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaskesImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final double jarak;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String alamat;
  @override
  final String kategori;
  final List<Dokter> _listDokter;
  @override
  @JsonKey()
  List<Dokter> get listDokter {
    if (_listDokter is EqualUnmodifiableListView) return _listDokter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listDokter);
  }

  @override
  final String? gambar;

  @override
  String toString() {
    return 'Faskes(id: $id, nama: $nama, jarak: $jarak, latitude: $latitude, longitude: $longitude, alamat: $alamat, kategori: $kategori, listDokter: $listDokter, gambar: $gambar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaskesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jarak, jarak) || other.jarak == jarak) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.kategori, kategori) ||
                other.kategori == kategori) &&
            const DeepCollectionEquality()
                .equals(other._listDokter, _listDokter) &&
            (identical(other.gambar, gambar) || other.gambar == gambar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nama,
      jarak,
      latitude,
      longitude,
      alamat,
      kategori,
      const DeepCollectionEquality().hash(_listDokter),
      gambar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaskesImplCopyWith<_$FaskesImpl> get copyWith =>
      __$$FaskesImplCopyWithImpl<_$FaskesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaskesImplToJson(
      this,
    );
  }
}

abstract class _Faskes implements Faskes {
  const factory _Faskes(
      {required final String id,
      required final String nama,
      required final double jarak,
      required final String latitude,
      required final String longitude,
      required final String alamat,
      required final String kategori,
      final List<Dokter> listDokter,
      final String? gambar}) = _$FaskesImpl;

  factory _Faskes.fromJson(Map<String, dynamic> json) = _$FaskesImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  double get jarak;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get alamat;
  @override
  String get kategori;
  @override
  List<Dokter> get listDokter;
  @override
  String? get gambar;
  @override
  @JsonKey(ignore: true)
  _$$FaskesImplCopyWith<_$FaskesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
