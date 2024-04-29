// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fasilitas_kesehatan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FasilitasKesehatan _$FasilitasKesehatanFromJson(Map<String, dynamic> json) {
  return _FasilitasKesehatan.fromJson(json);
}

/// @nodoc
mixin _$FasilitasKesehatan {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String get jarak => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  String get profil => throw _privateConstructorUsedError;
  List<Dokter> get daftarDokter => throw _privateConstructorUsedError;
  String? get gambar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FasilitasKesehatanCopyWith<FasilitasKesehatan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FasilitasKesehatanCopyWith<$Res> {
  factory $FasilitasKesehatanCopyWith(
          FasilitasKesehatan value, $Res Function(FasilitasKesehatan) then) =
      _$FasilitasKesehatanCopyWithImpl<$Res, FasilitasKesehatan>;
  @useResult
  $Res call(
      {String id,
      String nama,
      String jarak,
      String alamat,
      String profil,
      List<Dokter> daftarDokter,
      String? gambar});
}

/// @nodoc
class _$FasilitasKesehatanCopyWithImpl<$Res, $Val extends FasilitasKesehatan>
    implements $FasilitasKesehatanCopyWith<$Res> {
  _$FasilitasKesehatanCopyWithImpl(this._value, this._then);

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
    Object? alamat = null,
    Object? profil = null,
    Object? daftarDokter = null,
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
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      profil: null == profil
          ? _value.profil
          : profil // ignore: cast_nullable_to_non_nullable
              as String,
      daftarDokter: null == daftarDokter
          ? _value.daftarDokter
          : daftarDokter // ignore: cast_nullable_to_non_nullable
              as List<Dokter>,
      gambar: freezed == gambar
          ? _value.gambar
          : gambar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FasilitasKesehatanImplCopyWith<$Res>
    implements $FasilitasKesehatanCopyWith<$Res> {
  factory _$$FasilitasKesehatanImplCopyWith(_$FasilitasKesehatanImpl value,
          $Res Function(_$FasilitasKesehatanImpl) then) =
      __$$FasilitasKesehatanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nama,
      String jarak,
      String alamat,
      String profil,
      List<Dokter> daftarDokter,
      String? gambar});
}

/// @nodoc
class __$$FasilitasKesehatanImplCopyWithImpl<$Res>
    extends _$FasilitasKesehatanCopyWithImpl<$Res, _$FasilitasKesehatanImpl>
    implements _$$FasilitasKesehatanImplCopyWith<$Res> {
  __$$FasilitasKesehatanImplCopyWithImpl(_$FasilitasKesehatanImpl _value,
      $Res Function(_$FasilitasKesehatanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? jarak = null,
    Object? alamat = null,
    Object? profil = null,
    Object? daftarDokter = null,
    Object? gambar = freezed,
  }) {
    return _then(_$FasilitasKesehatanImpl(
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
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      profil: null == profil
          ? _value.profil
          : profil // ignore: cast_nullable_to_non_nullable
              as String,
      daftarDokter: null == daftarDokter
          ? _value._daftarDokter
          : daftarDokter // ignore: cast_nullable_to_non_nullable
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
class _$FasilitasKesehatanImpl implements _FasilitasKesehatan {
  const _$FasilitasKesehatanImpl(
      {required this.id,
      required this.nama,
      required this.jarak,
      required this.alamat,
      required this.profil,
      final List<Dokter> daftarDokter = const [],
      this.gambar})
      : _daftarDokter = daftarDokter;

  factory _$FasilitasKesehatanImpl.fromJson(Map<String, dynamic> json) =>
      _$$FasilitasKesehatanImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String jarak;
  @override
  final String alamat;
  @override
  final String profil;
  final List<Dokter> _daftarDokter;
  @override
  @JsonKey()
  List<Dokter> get daftarDokter {
    if (_daftarDokter is EqualUnmodifiableListView) return _daftarDokter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daftarDokter);
  }

  @override
  final String? gambar;

  @override
  String toString() {
    return 'FasilitasKesehatan(id: $id, nama: $nama, jarak: $jarak, alamat: $alamat, profil: $profil, daftarDokter: $daftarDokter, gambar: $gambar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FasilitasKesehatanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.jarak, jarak) || other.jarak == jarak) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.profil, profil) || other.profil == profil) &&
            const DeepCollectionEquality()
                .equals(other._daftarDokter, _daftarDokter) &&
            (identical(other.gambar, gambar) || other.gambar == gambar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, jarak, alamat, profil,
      const DeepCollectionEquality().hash(_daftarDokter), gambar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FasilitasKesehatanImplCopyWith<_$FasilitasKesehatanImpl> get copyWith =>
      __$$FasilitasKesehatanImplCopyWithImpl<_$FasilitasKesehatanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FasilitasKesehatanImplToJson(
      this,
    );
  }
}

abstract class _FasilitasKesehatan implements FasilitasKesehatan {
  const factory _FasilitasKesehatan(
      {required final String id,
      required final String nama,
      required final String jarak,
      required final String alamat,
      required final String profil,
      final List<Dokter> daftarDokter,
      final String? gambar}) = _$FasilitasKesehatanImpl;

  factory _FasilitasKesehatan.fromJson(Map<String, dynamic> json) =
      _$FasilitasKesehatanImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String get jarak;
  @override
  String get alamat;
  @override
  String get profil;
  @override
  List<Dokter> get daftarDokter;
  @override
  String? get gambar;
  @override
  @JsonKey(ignore: true)
  _$$FasilitasKesehatanImplCopyWith<_$FasilitasKesehatanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
