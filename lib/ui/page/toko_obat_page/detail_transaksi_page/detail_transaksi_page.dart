import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailTransaksiPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const DetailTransaksiPage({super.key, required this.transaksi});

  @override
  ConsumerState<DetailTransaksiPage> createState() =>
      _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends ConsumerState<DetailTransaksiPage> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () => ref.read(routerProvider).pushNamed('main'),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Detail Pemesanan',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Test transaksi 
          Text(widget.transaksi.toString()),
        ],
      ),
    );
  }
}
