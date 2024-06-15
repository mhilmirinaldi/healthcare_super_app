import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/domain/entity/rekomendasi_dokter.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';

class DokterCard extends StatelessWidget {
  final RekomendasiDokter dokter;

  const DokterCard({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {log('Card on tap');},
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey,
        surfaceTintColor: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Placeholder for doctor's image
              Container(
                width: 66,
                height: 66,
                color: Colors.grey,
                child: dokter.gambar == null || dokter.gambar!.isEmpty
                    ? const Icon(Icons.person)
                    : Image.network(dokter.gambar!, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              // Doctor's information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dokter.nama,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Dokter Umum',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        Text(
                          dokter.ratingTotal.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.work, size: 14, color: Colors.grey),
                        Text(
                          '${dokter.lamaKerja} tahun',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dokter.harga.toIDRCurrency(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Chat button
              ElevatedButton(
                onPressed: () {log('Chat button on tap');},
                child: const Text('Chat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
