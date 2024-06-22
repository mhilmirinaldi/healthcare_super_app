// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kategori_spesialis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KategoriSpesialis _$KategoriSpesialisFromJson(Map<String, dynamic> json) {
  return _KategoriSpesialis.fromJson(json);
}

/// @nodoc
mixin _$KategoriSpesialis {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KategoriSpesialisCopyWith<KategoriSpesialis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KategoriSpesialisCopyWith<$Res> {
  factory $KategoriSpesialisCopyWith(
          KategoriSpesialis value, $Res Function(KategoriSpesialis) then) =
      _$KategoriSpesialisCopyWithImpl<$Res, KategoriSpesialis>;
  @useResult
  $Res call({String id, String nama, String? icon});
}

/// @nodoc
class _$KategoriSpesialisCopyWithImpl<$Res, $Val extends KategoriSpesialis>
    implements $KategoriSpesialisCopyWith<$Res> {
  _$KategoriSpesialisCopyWithImpl(this._value, this._then);

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
abstract class _$$KategoriSpesialisImplCopyWith<$Res>
    implements $KategoriSpesialisCopyWith<$Res> {
  factory _$$KategoriSpesialisImplCopyWith(_$KategoriSpesialisImpl value,
          $Res Function(_$KategoriSpesialisImpl) then) =
      __$$KategoriSpesialisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nama, String? icon});
}

/// @nodoc
class __$$KategoriSpesialisImplCopyWithImpl<$Res>
    extends _$KategoriSpesialisCopyWithImpl<$Res, _$KategoriSpesialisImpl>
    implements _$$KategoriSpesialisImplCopyWith<$Res> {
  __$$KategoriSpesialisImplCopyWithImpl(_$KategoriSpesialisImpl _value,
      $Res Function(_$KategoriSpesialisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? icon = freezed,
  }) {
    return _then(_$KategoriSpesialisImpl(
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
class _$KategoriSpesialisImpl implements _KategoriSpesialis {
  const _$KategoriSpesialisImpl(
      {required this.id, required this.nama, this.icon});

  factory _$KategoriSpesialisImpl.fromJson(Map<String, dynamic> json) =>
      _$$KategoriSpesialisImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String? icon;

  @override
  String toString() {
    return 'KategoriSpesialis(id: $id, nama: $nama, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KategoriSpesialisImpl &&
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
  _$$KategoriSpesialisImplCopyWith<_$KategoriSpesialisImpl> get copyWith =>
      __$$KategoriSpesialisImplCopyWithImpl<_$KategoriSpesialisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KategoriSpesialisImplToJson(
      this,
    );
  }
}

abstract class _KategoriSpesialis implements KategoriSpesialis {
  const factory _KategoriSpesialis(
      {required final String id,
      required final String nama,
      final String? icon}) = _$KategoriSpesialisImpl;

  factory _KategoriSpesialis.fromJson(Map<String, dynamic> json) =
      _$KategoriSpesialisImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$KategoriSpesialisImplCopyWith<_$KategoriSpesialisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
