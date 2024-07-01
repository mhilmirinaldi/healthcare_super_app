import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/check_out_fakses_page/check_out_faskes_card.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/detail_transaksi_page/detail_transaksi_obat_card.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_resep_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailPesananFaskesPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const DetailPesananFaskesPage({super.key, required this.transaksi});

  @override
  ConsumerState<DetailPesananFaskesPage> createState() =>
      _CheckoutFaskesPageState();
}

class _CheckoutFaskesPageState extends ConsumerState<DetailPesananFaskesPage> {
  @override
  Widget build(BuildContext context) {
    final totalHargaBarang = widget.transaksi.totalHarga;
    final listResepObat = ref.watch(listResepObatProvider);

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
                onPressed: () => ref.read(routerProvider).goNamed('main', extra: 3)
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Detail Transaksi',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          Column(children: [
            CheckoutFaskesCard(
              dokter: widget.transaksi.dokter!,
              transaksi: widget.transaksi,
            ),
          ]),
          const SizedBox(height: 2),
          Container(
            width: 380,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[400]!),
              ),
            ),
            child: const Text(
              'Total Pembayaran',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biaya Pendaftaran',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                (totalHargaBarang - 6000).toIDRCurrency(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biaya Layanan',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                6000.toIDRCurrency(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Jumlah Pembayaran',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                (totalHargaBarang).toIDRCurrency(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.transaksi.status == 'belum selesai')
            Column(
              children: [
                Container(
                  width: 380,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                  child: const Text(
                    'QR Code Pendaftaran',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey, width: 1),
                    image: const DecorationImage(
                      image: AssetImage('assets/qr_code.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          if (widget.transaksi.status == 'selesai')
            Column(
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
                    'Diagnosis',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Alergi',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 380,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                  child: const Text(
                    'Resep Obat',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                listResepObat.when(
                  data: (obats) {
                    return Column(
                      children: obats
                          .map((obat) => DetailTransaksiObatCard(obat: obat))
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
              ],
            ),
        ],
      ),
    );
  }
}
