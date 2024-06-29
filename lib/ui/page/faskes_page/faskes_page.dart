import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/user_info.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/category_spesialis_item.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/faskes_card.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/list_kategori_spesialis_provider.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/list_rekomendasi_faskes_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class FaskesPage extends ConsumerWidget {
  const FaskesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listFaskes = ref.watch(listRekomendasiFaskesProvider);
    final kategori = ref.watch(listKategoriSpesialisProvider);

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
                        'Buat Janji Offline ',
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
                      ref.read(routerProvider).pushNamed('search_faskes');
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
                            'Cari nama fasilitas kesehatan',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaces(18),
                  const Text('Fasilitas Kesehatan Terdekat',
                      style: TextStyle(fontSize: 18)),
                  listFaskes.maybeWhen(
                    data: (faskess) => faskess.isNotEmpty
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: faskess
                                  .map((faskes) => Padding(
                                        padding: EdgeInsets.only(
                                            left: faskes == faskess.first ? 2 : 15,
                                            right: faskes == faskess.last ? 2 : 0),
                                        child: FaskesCard(faskes: faskes),
                                      ))
                                  .toList(),
                            ),
                          )
                        : const Center(
                            child: Text('Tidak ada rekomendasi faskes')),
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  verticalSpaces(8),
                  const Text('Spesialis', style: TextStyle(fontSize: 18)),
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
                            return categorySpesialisItem(
                              ref,
                              context,
                              const KategoriSpesialis(
                                  id: '99',
                                  nama: 'Lainnya',
                                  icon: 'assets/lainnya.png'),
                              isLainnya: true,
                            );
                          } else {
                            return categorySpesialisItem(
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
