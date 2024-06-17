import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';

class DokterCard extends StatelessWidget {
  final Dokter dokter;

  const DokterCard({super.key, required this.dokter});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('Card on tap');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            children: [
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1),
                    image: DecorationImage(
                        image: dokter.gambar == null || dokter.gambar!.isEmpty
                            ? const AssetImage(
                                'assets/default_profile_doctor_male.png')
                            : NetworkImage(dokter.gambar!) as ImageProvider,
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      dokter.nama,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Dokter Umum',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
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
                    const SizedBox(height: 6),
                    Text(
                      dokter.harga.toIDRCurrency(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  log('Chat button on tap');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFE1004E)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Chat',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
