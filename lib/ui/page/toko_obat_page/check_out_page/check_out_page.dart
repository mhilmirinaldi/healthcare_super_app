import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi_param.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/check_out_page/check_out_item_card.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/create_transaksi_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartProviderWatch = ref.watch(cartProvider);
    final totalHargaBarang = cartProviderWatch.items.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + (element.harga * element.jumlah!));

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
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Pembayaran',
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
          Column(
            children: cart.items.map((e) => CheckoutItemCard(obat: e)).toList(),
          ),
          const SizedBox(height: 4),
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
                'Biaya Barang',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                totalHargaBarang.toIDRCurrency(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biaya Pengiriman',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                9000.toIDRCurrency(),
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
                (15000 + totalHargaBarang).toIDRCurrency(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            width: 380,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[400]!),
              ),
            ),
            child: const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          const SizedBox(height: 6),
          // Pilih metode pembayaran
        ],
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
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
                const Text('Total Pembayaran'),
                const SizedBox(height: 4),
                Text(
                  (15000 + totalHargaBarang).toIDRCurrency(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                int waktuTransaksi = DateTime.now().millisecondsSinceEpoch;

                Transaksi transaksi = Transaksi(
                    id: 'obat-$waktuTransaksi-${ref.read(userDataProvider).value!.id}',
                    idUser: ref.read(userDataProvider).value!.id,
                    judul: 'Pembelian obat',
                    kategori: 'obat',
                    waktuTransaksi: waktuTransaksi,
                    totalHarga: (15000 + totalHargaBarang),
                    listObat: cart.items);

                CreateTransaksi createTransaksi =
                    ref.read(createTransaksiProvider);

                await createTransaksi(
                        CreateTransaksiParam(transaksi: transaksi))
                    .then((result) {
                  switch (result) {
                    case Success(value: _):
                      ref
                          .read(transaksiDataProvider.notifier)
                          .refreshTransaksiData();
                      ref.read(userDataProvider.notifier).refreshUserData();
                      ref.read(cartProvider.notifier).removeAllItem();
                    // Show popup selama 2 detik dan pindah ke halaman transaksi detail yang terdapat tracking petanya
                    ref.read(routerProvider).pop();
                    case Failed(:final message):
                      context.showSnackBar(message);
                  }
                });
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
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
                minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Bayar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
