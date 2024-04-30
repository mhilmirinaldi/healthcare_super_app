import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_dokter_repository.dart';
import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/domain/usecase/login/login.dart';
import 'package:super_app_telemedicine/ui/page/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/login_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Login login = ref.watch(loginProvider);

              // login(LoginParams(email: "admin@gmail.com", password: '123456'))
              //     .then((result){
              //       if (result.isSuccess){
              //         Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => MainPage(user: result.resultValue!),
              //         ));
              //       } else {
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           content: Text(result.errorMessage!),
              //         ));
              //       }
              //     });

              FirebaseDokterRepository dokterRepository = FirebaseDokterRepository();
              // dokterRepository.getRekomendasiDokter().then((result){
              //   if (result.isSuccess){
              //     // RekomendasiDokter rekomendasiDokter = result.resultValue![0];
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });
              dokterRepository.getDokterByKategori(idKategori: '1').then((result){
                if (result.isSuccess){
                  log(result.resultValue.toString());
                } else {
                  log('gagal');
                  log(result.errorMessage.toString());
                }
              });
            },
            child: Text("Login"),
          ),
        ));
  }
}
