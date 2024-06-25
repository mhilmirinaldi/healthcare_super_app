import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/result.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi.dart';
import 'package:super_app_telemedicine/domain/usecase/create_transaksi/create_transaksi_param.dart';
import 'package:super_app_telemedicine/ui/extension/build_context_extension.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/check_out_page/check_out_item_card.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';
import 'package:super_app_telemedicine/ui/provider/usecase/create_transaksi_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  String _selectedPaymentCategory = 'Uang Elektronik';
  String _selectedPaymentMethod = 'Gopay';

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 12),
          // Pilih metode pembayaran
          _buildPaymentMethodContainer(),
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

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    bool paymentProcessed = false;

                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        Future.delayed(const Duration(seconds: 1), () {
                          if (context.mounted) {
                            setState(() {
                              paymentProcessed = true;
                            });
                          }
                        });

                        return AlertDialog(
                          surfaceTintColor: Colors.white,
                          content: SizedBox(
                            height: 125,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: paymentProcessed
                                  ? [
                                      const SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Icon(Icons.check_circle_rounded,
                                            color: primaryColor, size: 55),
                                      ),
                                      const Text('Pembayaran berhasil'),
                                    ]
                                  : [
                                      const SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator()),
                                      const Text('Memproses pembayaran...'),
                                    ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );

                await Future.delayed(const Duration(seconds: 2));
                // if (context.mounted) {
                //   Navigator.pop(context);
                // }

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
                      ref
                          .read(routerProvider)
                          .pushNamed('main');

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

  Widget _buildPaymentMethodContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildPaymentMethodHeader(),
          ..._buildPaymentMethodOptions(),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[400]!),
        ),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentCategory = 'Uang Elektronik';
                _selectedPaymentMethod = 'Gopay';
              });
            },
            child: Text(
              'Uang Elektronik',
              style: TextStyle(
                fontWeight: _selectedPaymentCategory == 'Uang Elektronik'
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: _selectedPaymentCategory == 'Uang Elektronik'
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentCategory = 'Bank Transfer';
                _selectedPaymentMethod = 'BCA';
              });
            },
            child: Text(
              'Bank Transfer',
              style: TextStyle(
                fontWeight: _selectedPaymentCategory == 'Bank Transfer'
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: _selectedPaymentCategory == 'Bank Transfer'
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPaymentMethodOptions() {
    switch (_selectedPaymentCategory) {
      case 'Uang Elektronik':
        return _buildUangElektronikOptions();
      case 'Bank Transfer':
        return _buildBankTransferOptions();
      default:
        return [];
    }
  }

  List<Widget> _buildUangElektronikOptions() {
    return [
      ListTile(
        title: Text('Gopay'),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = 'Gopay';
          });
        },
        leading: Radio(
          value: 'Gopay',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value as String;
            });
          },
        ),
      ),
      ListTile(
        title: Text('OVO'),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = 'OVO';
          });
        },
        leading: Radio(
          value: 'OVO',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value as String;
            });
          },
        ),
      ),
    ];
  }

  List<Widget> _buildBankTransferOptions() {
    return [
      ListTile(
        title: Text('BCA'),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = 'BCA';
          });
        },
        leading: Radio(
          value: 'BCA',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value as String;
            });
          },
        ),
      ),
      ListTile(
        title: Text('Mandiri'),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = 'Mandiri';
          });
        },
        leading: Radio(
          value: 'Mandiri',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value as String;
            });
          },
        ),
      ),
    ];
  }
}
