import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/category_item.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/dokter_card.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/user_info.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_kategori_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_rekomendasi_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listDokter = ref.watch(listRekomendasiDokterProvider);
    final kategori = ref.watch(listKategoriDokterProvider);

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chat Dengan Dokter',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 29,
                        child: IconButton(
                          padding: const EdgeInsets.only(top: 3),
                          icon: const Icon(Icons.history, size: 24),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey,),
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
                            'Cari nama dokter atau spesialis',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaces(18),
                  const Text('Rekomendasi Dokter',
                      style: TextStyle(fontSize: 18)),
                  ...listDokter.maybeWhen(
                    data: (dokters) => dokters
                        .map((dokter) => DokterCard(dokter: dokter))
                        .toList(),
                    orElse: () =>
                        [const Center(child: CircularProgressIndicator())],
                  ),
                  verticalSpaces(8),
                  const Text('Kategori', style: TextStyle(fontSize: 18)),
                  verticalSpaces(14),
                  kategori.maybeWhen(
                    data: (kategoris) {
                      final displayedKategoris = kategoris.take(8).toList();
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1,
                        ),
                        itemCount: displayedKategoris.length + 1,
                        itemBuilder: (context, index) {
                          if (index == displayedKategoris.length) {
                            return categoryItem(
                              ref,
                              context,
                              const KategoriDokter(
                                  id: '99',
                                  name: 'Lainnya',
                                  icon: 'assets/lainnya.png'),
                              isLainnya: true,
                            );
                          } else {
                            return categoryItem(
                              ref,
                              context,
                              displayedKategoris[index],
                            );
                          }
                        },
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
