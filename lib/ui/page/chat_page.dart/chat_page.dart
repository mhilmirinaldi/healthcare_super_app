import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/category_item.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/dokter_card.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/search_page/search_page.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/user_info.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_kategori_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_rekomendasi_dokter_provider.dart';

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
                  const Text(
                    'Chat dengan dokter',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(),
                  verticalSpaces(14),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Cari dokter, spesialis atau gejala',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaces(18),
                  const Text('Rekomendasi dokter',
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
