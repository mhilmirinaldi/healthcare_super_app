import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/list_rekomendasi_faskes_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

Widget checkoutFaskesCard(
    {required Dokter dokter,
    required Transaksi transaksi,
    required WidgetRef ref}) {
  final kategoriFaskes = ref.watch(listRekomendasiFaskesProvider);

  return Container(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            ref
                .read(routerProvider)
                .pushNamed('detail_dokter_faskes', extra: dokter);
          },
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    image: dokter.gambar == null || dokter.gambar!.isEmpty
                        ? dokter.jenisKelamin == 'Laki-laki'
                            ? const AssetImage(
                                'assets/default_profile_doctor_male.png')
                            : const AssetImage(
                                'assets/default_profile_doctor_female.png')
                        : NetworkImage(dokter.gambar!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dokter.nama,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    dokter.kategori,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 15, color: Colors.orange),
                      const SizedBox(width: 1),
                      Text(
                        dokter.ratingTotal.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.work, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 2),
                      Text(
                        '${dokter.lamaKerja} Tahun',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () {
            kategoriFaskes.when(
              data: (faskes) {
                if (faskes.isEmpty) {
                  return const Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 220),
                          child: Text('Tidak ada hasil ditemukan')));
                } else {
                  // filter faskes by name
                  final faskesSort = faskes
                      .where((element) =>
                          element.nama == transaksi.dokter!.tempatPraktik)
                      .toList();
                  return ref
                      .read(routerProvider)
                      .pushNamed('detail_faskes', extra: faskesSort[0]);
                }
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            );
          },
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    image: dokter.gambar == null || dokter.gambar!.isEmpty
                        ? const AssetImage('assets/default_hospital_2.png')
                        : NetworkImage(dokter.gambar!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dokter.tempatPraktik,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  kategoriFaskes.when(
                    data: (faskes) {
                      if (faskes.isEmpty) {
                        return const Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 220),
                                child: Text('Tidak ada hasil ditemukan')));
                      } else {
                        // filter faskes by name
                        final faskesSort = faskes
                            .where((element) =>
                                element.nama == transaksi.dokter!.tempatPraktik)
                            .toList();
                        return Text(
                          faskesSort[0].kategori,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[800]),
                        );
                      }
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 15, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        formatDate(DateTime.fromMillisecondsSinceEpoch(
                            transaksi.waktuJanji!)),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 2),
                      Text(
                          formateTime(
                            DateTime.fromMillisecondsSinceEpoch(
                                transaksi.waktuJanji!),
                          ),
                          style: const TextStyle(fontSize: 13)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
