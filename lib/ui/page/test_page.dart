import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_dokter_repository.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_dokter/get_kategori_dokter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              GetKategoriDokter getKategoriDokter = GetKategoriDokter(kategoriDokterRepository: FirebaseKategoriDokterRepository());
              getKategoriDokter(null).then((result){
                if (result.isSuccess){
                  log(result.resultValue.toString());
                } else {
                  log('gagal');
                  log(result.errorMessage.toString());
                }
              });
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

              // FirebaseDokterRepository dokterRepository = FirebaseDokterRepository();
              // dokterRepository.getRekomendasiDokter().then((result){
              //   if (result.isSuccess){
              //     // RekomendasiDokter rekomendasiDokter = result.resultValue![0];
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });

              // FirebaseKategoriDokterRepository kategoriDokterRepository = FirebaseKategoriDokterRepository();
              // KategoriDokter kategoriDokter = const KategoriDokter(id: '8', name: 'Spesialis Kandungan');

              // kategoriDokterRepository.createKategoriDokter(kategoriDokter: kategoriDokter).then((result){
              //   if (result.isSuccess){
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });

              // FirebaseDokterRepository dokterRepository = FirebaseDokterRepository();
              // log('Panggil langsung repository');
              // dokterRepository.getRekomendasiDokter().then((result){
              //   if (result.isSuccess){
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });

              // log('Panggil lewat usecase');
              // GetRekomendasiDokter getRekomendasiDokter = GetRekomendasiDokter(dokterRepository: FirebaseDokterRepository());
              // getRekomendasiDokter(null).then((result){
              //   if (result.isSuccess){
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });
              // GetDokterDetail getDokterDetail = GetDokterDetail(dokterRepository: FirebaseDokterRepository());
              // getDokterDetail(GetDokterDetailParam(id: '2')).then((result){
              //   if (result.isSuccess){
              //     log(result.resultValue.toString());
              //   } else {
              //     log('gagal');
              //     log(result.errorMessage.toString());
              //   }
              // });
            },
            child: Text("Login"),
          ),
        ));
  }
}
