import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/dokter_card.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/search_bar.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/user_info.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_rekomendasi_dokter_provider.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDokter = ref.watch(listRekomendasiDokterProvider);

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chat dengan dokter',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const Divider(),
                  verticalSpaces(14),
                  searchBar(),
                  verticalSpaces(18),
                  const Text('Rekomendasi dokter',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  ...listDokter.maybeWhen(
                    data: (dokters) => dokters
                        .map((dokter) => DokterCard(dokter: dokter))
                        .toList(),
                    orElse: () =>
                        [const Center(child: CircularProgressIndicator())],
                  ),
                  verticalSpaces(8),
                  const Text('Kategori',
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
