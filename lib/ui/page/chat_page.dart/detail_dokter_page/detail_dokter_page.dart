import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/detail_dokter_page/info_row.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/detail_dokter_page/review_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailDokterPage extends ConsumerWidget {
  final Dokter dokter;

  const DetailDokterPage({super.key, required this.dokter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => ref.read(routerProvider).pop(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFFCCD8EF),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: dokter.gambar == null || dokter.gambar!.isEmpty
                        ? const AssetImage(
                            'assets/default_profile_doctor_male_transparent.png')
                        : NetworkImage(dokter.gambar!) as ImageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                dokter.nama,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Dokter Umum',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.only(
                        left: 2, right: 4, top: 1, bottom: 1),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          dokter.ratingTotal?.toStringAsFixed(1) ?? '0.0',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.only(
                        left: 3, right: 5, top: 1, bottom: 1),
                    child: Row(
                      children: [
                        Icon(Icons.work, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${dokter.lamaKerja} Tahun',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              infoRow('Alumnus', dokter.alumnus, 'assets/alumnus.png'),
              const SizedBox(height: 8),
              infoRow('Tempat Praktik', dokter.tempatPraktik,
                  'assets/tempat_praktik.png'),
              const SizedBox(height: 8),
              infoRow('Nomor STR', dokter.id, 'assets/nomor_str.png'),
              const SizedBox(height: 16),
              const Text(
                'Review',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        const Icon(Icons.star, size: 16, color: Colors.orange),
        const SizedBox(width: 4),
        Text(
          dokter.ratingTotal?.toStringAsFixed(1) ?? '0.0',
          style: const TextStyle(fontSize: 14),
        ),
        const Text(
          ' / 5.0',
          style: TextStyle(fontSize: 14),
        ),
      ],
    ),
    Row(
      children: [
        Container(
          height: 40, // Atur tinggi dropdown
          child: DropdownButton<String>(
            value: 'Rating',
            items: <String>['Rating', 'Tanggal']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 40, // Atur tinggi dropdown
          child: DropdownButton<String>(
            value: 'Urutkan',
            items: <String>['Urutkan']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    ),
  ],
),

              ...dokter.review.map((rev) => reviewCard(rev)).toList(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Biaya Konsultasi'),
                Text(
                  dokter.harga.toIDRCurrency(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                log('Chat button on tap');
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                backgroundColor: const Color(0xFFE1004E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Chat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
