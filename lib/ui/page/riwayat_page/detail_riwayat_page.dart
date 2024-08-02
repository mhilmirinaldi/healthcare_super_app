import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/page/riwayat_page/transaksi_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';

class DetailRiwayatPage extends ConsumerStatefulWidget {
  final String kategori;

  const DetailRiwayatPage({super.key, required this.kategori});

  @override
  ConsumerState<DetailRiwayatPage> createState() => _CheckoutFaskesPageState();
}

class _CheckoutFaskesPageState extends ConsumerState<DetailRiwayatPage> {
  @override
  Widget build(BuildContext context) {
    final listTransaksi = ref.watch(transaksiDataProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => ref.read(routerProvider).pop(),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.kategori == 'chat'
                        ? 'Riwayat Konsultasi Online'
                        : widget.kategori == 'obat'
                            ? 'Riwayat Pembelian Obat'
                            : 'Riwayat Pendaftaran Fasilitas Kesehatan',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        children: [
          Column(children: [
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
                      .where(
                          (transaksi) => transaksi.kategori == widget.kategori)
                      .toList();
                  return Column(
                    children: transaksis.map((transaksi) {
                      return transaksiCard(transaksi, ref);
                    }).toList(),
                  );
                }
              },
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
              loading: () => const Center(child: CircularProgressIndicator()),
            )
          ]),
        ],
      ),
    );
  }
}
