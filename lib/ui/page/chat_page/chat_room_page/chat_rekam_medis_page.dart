import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/chat_rekam_medis_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';

class ChatRekamMedisPage extends ConsumerStatefulWidget {
  const ChatRekamMedisPage({super.key});

  @override
  ConsumerState<ChatRekamMedisPage> createState() => _CheckoutFaskesPageState();
}

class _CheckoutFaskesPageState extends ConsumerState<ChatRekamMedisPage> {
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
              title: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Riwayat Rekam Medis',
                      style: TextStyle(fontSize: 18),
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
                        .where((transaksi) => transaksi.status == 'selesai')
                        .toList();
                    return Column(
                      children: transaksis.map((transaksi) {
                        return ChatRekamMedisCard(transaksi: transaksi);
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
        bottomNavigationBar: Container(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Lampirkan',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ));
  }
}
