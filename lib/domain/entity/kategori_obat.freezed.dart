// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kategori_obat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KategoriObat _$KategoriObatFromJson(Map<String, dynamic> json) {
  return _KategoriObat.fromJson(json);
}

/// @nodoc
mixin _$KategoriObat {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KategoriObatCopyWith<KategoriObat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KategoriObatCopyWith<$Res> {
  factory $KategoriObatCopyWith(
          KategoriObat value, $Res Function(KategoriObat) then) =
      _$KategoriObatCopyWithImpl<$Res, KategoriObat>;
  @useResult
  $Res call({String id, String nama, String? icon});
}

/// @nodoc
class _$KategoriObatCopyWithImpl<$Res, $Val extends KategoriObat>
    implements $KategoriObatCopyWith<$Res> {
  _$KategoriObatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? icon = freezed,
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
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KategoriObatImplCopyWith<$Res>
    implements $KategoriObatCopyWith<$Res> {
  factory _$$KategoriObatImplCopyWith(
          _$KategoriObatImpl value, $Res Function(_$KategoriObatImpl) then) =
      __$$KategoriObatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nama, String? icon});
}

/// @nodoc
class __$$KategoriObatImplCopyWithImpl<$Res>
    extends _$KategoriObatCopyWithImpl<$Res, _$KategoriObatImpl>
    implements _$$KategoriObatImplCopyWith<$Res> {
  __$$KategoriObatImplCopyWithImpl(
      _$KategoriObatImpl _value, $Res Function(_$KategoriObatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? icon = freezed,
  }) {
    return _then(_$KategoriObatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KategoriObatImpl implements _KategoriObat {
  const _$KategoriObatImpl({required this.id, required this.nama, this.icon});

  factory _$KategoriObatImpl.fromJson(Map<String, dynamic> json) =>
      _$$KategoriObatImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String? icon;

  @override
  String toString() {
    return 'KategoriObat(id: $id, nama: $nama, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KategoriObatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KategoriObatImplCopyWith<_$KategoriObatImpl> get copyWith =>
      __$$KategoriObatImplCopyWithImpl<_$KategoriObatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KategoriObatImplToJson(
      this,
    );
  }
}

abstract class _KategoriObat implements KategoriObat {
  const factory _KategoriObat(
      {required final String id,
      required final String nama,
      final String? icon}) = _$KategoriObatImpl;

  factory _KategoriObat.fromJson(Map<String, dynamic> json) =
      _$KategoriObatImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$KategoriObatImplCopyWith<_$KategoriObatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
