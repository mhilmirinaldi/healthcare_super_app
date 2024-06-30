import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_resep_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class CatetanDokerCard extends ConsumerStatefulWidget {
  const CatetanDokerCard({
    super.key,
  });

  @override
  ConsumerState<CatetanDokerCard> createState() => _CatetanDokerCardState();
}

class _CatetanDokerCardState extends ConsumerState<CatetanDokerCard> {
  @override
  Widget build(BuildContext context) {
    // final kategoriFaskes = ref.watch(listRekomendasiFaskesProvider);
    final listResepObat = ref.watch(listResepObatProvider);
    List<Obat> listObat = [];

    listResepObat.when(
      data: (obats) {
        listObat.addAll(obats);
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(
        error.toString(),
        style: const TextStyle(color: Colors.red),
      ),
    );

    return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 380,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              child: const Text(
                'Catatan Dokter',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Gejala',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Gatal di daerah tangan',
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 6),
            const Text(
              'Diagnosis',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Peradangan kulit',
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            const SizedBox(height: 6),
            const Text(
              'Resep Obat',
              style: TextStyle(fontSize: 15),
            ),
            listResepObat.when(
              data: (obats) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: obats
                      .map(
                        (obat) => Text(
                          '- ${obat.nama} ${obat.jumlah} pcs',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[800]),
                        ),
                      )
                      .toList(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text(
                error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            ),
            // button to pesan
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(routerProvider)
                      .pushNamed('checkout_obat_chat', extra: listObat);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(326, 38),
                ),
                child: const Text(
                  'Pesan',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
