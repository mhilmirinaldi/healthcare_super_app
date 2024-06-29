import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/user_info.dart';
import 'package:super_app_telemedicine/ui/page/riwayat_page/transaksi_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';

class RiwayatPage extends ConsumerStatefulWidget {
  const RiwayatPage({super.key});

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends ConsumerState<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    final listTransaksi = ref.watch(transaksiDataProvider);

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Riwayat Rekam Medis',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  verticalSpaces(14),
                  GestureDetector(
                    onTap: () {
                      ref.read(routerProvider).pushNamed('search_page');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[500]),
                          const SizedBox(width: 8),
                          Text(
                            'Cari transaksi',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaces(8),
                  listTransaksi.when(
                    data: (transaksis) {
                      if (transaksis.isEmpty) {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 150),
                            Center(child: Text("Belum ada transaksi")),
                          ],
                        );
                      } else {
                        transaksis.sort((a, b) =>
                            -a.waktuTransaksi!.compareTo(b.waktuTransaksi!));
                        transaksis = transaksis
                            .where((transaksi) => transaksi.kategori != 'obat')
                            .toList();
                        return Column(
                          children: transaksis.map((transaksi) {
                            return TransaksiCard(transaksi: transaksi);
                          }).toList(),
                        );
                      }
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text("Error: $error")),
                    loading: () => const Center(child: CircularProgressIndicator()),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
