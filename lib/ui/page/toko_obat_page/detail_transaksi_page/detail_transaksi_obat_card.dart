import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailTransaksiObatCard extends ConsumerWidget {
  final Obat obat;

  const DetailTransaksiObatCard({super.key, required this.obat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          ref.read(routerProvider).pushNamed('detail_obat', extra: obat);
        },
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                      image: obat.gambar == null || obat.gambar!.isEmpty
                          ? const AssetImage(
                              'assets/default_medicine.png')
                          : NetworkImage(obat.gambar!) as ImageProvider,
                      fit: BoxFit.cover)),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  obat.nama,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  obat.harga.toIDRCurrency(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w400),
                ),
                // const SizedBox(height: 10),
              ],
            ),
            const Spacer(),
            Text(
              'x${obat.jumlah}',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
