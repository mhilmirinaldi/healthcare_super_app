import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class CheckOutChatCard extends ConsumerStatefulWidget {
  final Dokter dokter;

  const CheckOutChatCard(
      {super.key, required this.dokter});

  @override
  ConsumerState<CheckOutChatCard> createState() => _CheckOutChatCardState();
}

class _CheckOutChatCardState extends ConsumerState<CheckOutChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(routerProvider).pushNamed('detail_dokter', extra: widget.dokter);
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
                      image: widget.dokter.gambar == null ||
                              widget.dokter.gambar!.isEmpty
                          ? widget.dokter.jenisKelamin == 'Laki-laki'
                              ? const AssetImage(
                                  'assets/default_profile_doctor_male.png')
                              : const AssetImage(
                                  'assets/default_profile_doctor_female.png')
                          : NetworkImage(widget.dokter.gambar!) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dokter.nama,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.dokter.kategori,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 15, color: Colors.orange),
                        const SizedBox(width: 1),
                        Text(
                          widget.dokter.ratingTotal.toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.work, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.dokter.lamaKerja} Tahun',
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
}
