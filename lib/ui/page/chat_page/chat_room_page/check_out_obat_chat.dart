import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
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

class CheckOutObatChatPage extends ConsumerStatefulWidget {
  final List<Obat> obat;

  const CheckOutObatChatPage({super.key, required this.obat});

  @override
  ConsumerState<CheckOutObatChatPage> createState() => _CheckOutObatChatPageState();
}

class _CheckOutObatChatPageState extends ConsumerState<CheckOutObatChatPage> {
  String _selectedPaymentCategory = 'Uang Elektronik';
  String _selectedPaymentMethod = 'Gopay';

  @override
  Widget build(BuildContext context) {

    final totalHargaBarang = widget.obat.fold<int>(
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
            children: widget.obat.map((e) => checkoutItemCard(e, ref)).toList(),
          ),
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
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
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
                  judul: 'Pembelian Obat',
                  kategori: 'obat',
                  waktuTransaksi: waktuTransaksi,
                  totalHarga: (15000 + totalHargaBarang),
                  listObat: widget.obat,
                  status: 'belum selesai',
                );

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
                                          child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                            primaryColor,
                                          ))),
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

                await createTransaksi(
                        CreateTransaksiParam(transaksi: transaksi))
                    .then((result) {
                  switch (result) {
                    case Success(value: _):
                      ref
                          .read(routerProvider)
                          .pushNamed('detail_transaksi', extra: transaksi);

                      ref
                          .read(transaksiDataProvider.notifier)
                          .refreshTransaksiData();
                      ref.read(userDataProvider.notifier).refreshUserData();
                      ref.read(cartProvider.notifier).removeAllItem();

                    case Failed(:final message):
                      context.showSnackBar(message);
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFE1004E)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
                minimumSize: WidgetStateProperty.all(const Size(0, 0)),
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
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
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
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentCategory = 'Uang Elektronik';
                _selectedPaymentMethod = 'Gopay';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                ),
                color: _selectedPaymentCategory == 'Uang Elektronik'
                    ? Colors.white
                    : Colors.grey[200],
              ),
              child: Center(
                child: Text(
                  'Uang Elektronik',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: _selectedPaymentCategory == 'Uang Elektronik'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _selectedPaymentCategory == 'Uang Elektronik'
                        ? primaryColor
                        : Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentCategory = 'Bank Transfer';
                _selectedPaymentMethod = 'BCA';
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
                color: _selectedPaymentCategory == 'Bank Transfer'
                    ? Colors.white
                    : Colors.grey[200],
              ),
              child: Center(
                child: Text(
                  'Bank Transfer',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: _selectedPaymentCategory == 'Bank Transfer'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _selectedPaymentCategory == 'Bank Transfer'
                        ? primaryColor
                        : Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
      _buildPaymentOption('Gopay', 'assets/logo_bank/gopay.png'),
      _buildPaymentOption('Dana', 'assets/logo_bank/dana.png'),
      _buildPaymentOption('ShopeePay', 'assets/logo_bank/shopeepay.png'),
      _buildPaymentOption('OVO', 'assets/logo_bank/ovo.png'),
    ];
  }

  List<Widget> _buildBankTransferOptions() {
    return [
      _buildPaymentOption('BCA', 'assets/logo_bank/bca.png'),
      _buildPaymentOption('BNI', 'assets/logo_bank/bni.png'),
      _buildPaymentOption('BRI', 'assets/logo_bank/bri.png'),
      _buildPaymentOption('Mandiri', 'assets/logo_bank/mandiri.png'),
    ];
  }

  Widget _buildPaymentOption(String method, String assetPath) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: ListTile(
        leading:
            Image.asset(assetPath, width: 40), // Assuming the logos are 40x40
        title: Text(method),
        trailing: Radio(
          activeColor: primaryColor,
          value: method,
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value as String;
            });
          },
        ),
        onTap: () {
          setState(() {
            _selectedPaymentMethod = method;
          });
        },
      ),
    );
  }
}
