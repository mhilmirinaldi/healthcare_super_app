import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_app_telemedicine/domain/entity/user.dart';
import 'package:super_app_telemedicine/domain/usecase/get_logged_in_user/get_logged_in_user.dart';
import 'package:super_app_telemedicine/domain/usecase/login/login.dart';
import 'package:super_app_telemedicine/domain/usecase/register/register.dart';
import 'package:super_app_telemedicine/domain/usecase/register/register_param.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_kategori_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_rekomendasi_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_logged_in_user_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/login_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/logout_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/register_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var userResult = await getLoggedInUser(null);

    if (userResult.isSuccess) {
      _getListDokterAndKategori();
      return userResult.resultValue;
    } else {
      return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));

    if (result.isSuccess) {
      _getListDokterAndKategori();
      state = AsyncData(result.resultValue);
    } else {
      state =
          AsyncError(FlutterError(result.errorMessage!), StackTrace.current);
      state = const AsyncData(null);
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name}) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);

    var result = await register(
        RegisterParam(email: email, password: password, name: name));

    if (result.isSuccess) {
      _getListDokterAndKategori();
      state = AsyncData(result.resultValue);
    } else {
      state =
          AsyncError(FlutterError(result.errorMessage!), StackTrace.current);
      state = const AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var result = await getLoggedInUser(null);

    if (result.isSuccess) {
      state = AsyncData(result.resultValue);
    }
  }

  Future<void> logout() async {
    var logout = ref.read(logoutProvider);
    var result = await logout(null);

    if (result.isSuccess) {
      state = const AsyncData(null);
    } else {
      state =
          AsyncError(FlutterError(result.errorMessage!), StackTrace.current);
      state = AsyncData(state.valueOrNull);
    }
  }

  void _getListDokterAndKategori() {
    ref.read(listRekomendasiDokterProvider.notifier).getListRekomendasiDokter();
    ref.read(listKategoriDokterProvider.notifier).getListKategoriDokter();
  }
}
