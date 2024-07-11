import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_dokter_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_faskes_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_dokter_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_obat_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_kategori_spesialis_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_obat_repository.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_transaksi_repository.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/review.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_dokter/get_kategori_dokter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/usecase/get_kategori_obat/get_kategori_obat.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_kategori_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_kategori_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/get_kategori_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Row(
          children: [
            Image.asset('assets/category_spesialis/1.png'),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      bool paymentProcessed = false;

                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          Future.delayed(const Duration(seconds: 1), () {
                            if (context.mounted) {
                              setState(() {
                                paymentProcessed = true;
                              });
                            }
                          });

                          return AlertDialog(
                            surfaceTintColor: Colors.white,
                            content: SizedBox(
                              height: 125,
                              
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: paymentProcessed
                                    ? [
                                        const SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Icon(
                                              Icons.check_circle_rounded,
                                              color: primaryColor,
                                              size: 55),
                                        ),
                                        const Text('Pembayaran berhasil'),
                                      ]
                                    : [
                                        const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator(
                                                
                                            )),
                                        const Text('Memproses pembayaran...'),
                                      ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );

                  await Future.delayed(const Duration(seconds: 2));
                  if (context.mounted) {
                    Navigator.pop(context);
                  }

                  // Transaksi transaksi = const Transaksi(
                  //     id: 'tlx-02',
                  //     idUser: 'sdsdsd',
                  //     judul: 'Toko Obat',
                  //     kategori: 'Toko Obat',
                  //     waktuTransaksi: 123,
                  //     totalHarga: 123,
                  //     listObat: [
                  //       Obat(id: 'id', idKategori: 'idKategori', nama: 'nama', harga: 232323, satuan: 'satuan', deskripsi: 'deskripsi', dosis: 'dosis', komposisi: 'komposisi', aturan: 'aturan', jumlah: 2),
                  //       Obat(id: '23', idKategori: 'idKategori', nama: 'nama', harga: 232323, satuan: 'satuan', deskripsi: 'deskripsi', dosis: 'dosis', komposisi: 'komposisi', aturan: 'aturan', jumlah: 2),
                  //     ]);

                  // transaksiRepository.getUserTransaksis(idUser: 'sdsdsd').then((result) {
                  //   if (result.isSuccess) {
                  //     log(result.resultValue.toString());
                  //   } else {
                  //     log('gagal');
                  //     log(result.errorMessage.toString());
                  //   }
                  // });

                  // GetKategoriObat getKategoriObat = ref.watch(getKategoriObatProvider);
                  // getKategoriObat(null).then((result){
                  //   if (result.isSuccess){
                  //     log(result.resultValue.toString());
                  //   } else {
                  //     log('gagal');
                  //     log(result.errorMessage.toString());
                  //   }
                  // });

                  // TANPA PROVIDER
                  // GetKategoriDokter getKategoriDokter = GetKategoriDokter(
                  //     kategoriDokterRepository:
                  //         FirebaseKategoriDokterRepository());
                  // getKategoriDokter(null).then((result) {
                  //   if (result.isSuccess) {
                  //     log(result.resultValue.toString());
                  //   } else {
                  //     log('gagal');
                  //     log(result.errorMessage.toString());
                  //   }
                  // });

                  // DENGAN PROVIDER
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
                child: const Text("Create"),
              ),
            ),
          ],
        ));
  }
}
