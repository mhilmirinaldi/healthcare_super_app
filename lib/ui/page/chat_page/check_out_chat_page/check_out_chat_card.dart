import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

Widget checkoutChatCard(Dokter dokter, WidgetRef ref) {
  return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(routerProvider).pushNamed('detail_dokter', extra: dokter);
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
                      image: dokter.gambar == null ||
                              dokter.gambar!.isEmpty
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
        ],
      ),
    );

}
