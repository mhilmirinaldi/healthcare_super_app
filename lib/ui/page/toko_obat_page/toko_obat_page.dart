import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/user_info.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/category_obat_item.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/obat_card.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/pop_up_cart.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';
import 'package:super_app_telemedicine/ui/provider/cart/popup_provider.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_kategori_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_rekomendasi_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class TokoObatPage extends ConsumerWidget {
  const TokoObatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listObat = ref.watch(listRekomendasiObatProvider);
    final kategori = ref.watch(listKategoriObatProvider);
    final isVisible = ref.watch(popupProvider).isVisible;
    final cartProviderWatch = ref.watch(cartProvider);

    return Scaffold(
      body: Stack(
        children: [
          ListView(
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
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toko Obat',
                              style: TextStyle(fontSize: 20),
                            ),
                            // const Spacer(),
                            // SizedBox(
                            //   height: 29,
                            //   child: IconButton(
                            //     padding: const EdgeInsets.only(top: 3),
                            //     icon: const Icon(Icons.history, size: 24),
                            //     onPressed: () {
                            //       ref.read(routerProvider).pushNamed('detail_riwayat_page', extra: 'obat');
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        verticalSpaces(14),
                        GestureDetector(
                          onTap: () {
                            ref.read(routerProvider).pushNamed('search_obat');
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
                                  'Cari nama obat',
                                  style: TextStyle(color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpaces(14),
                        const Text('Rekomendasi Obat',
                            style: TextStyle(fontSize: 18)),
                        listObat.maybeWhen(
                          data: (obats) => obats.isNotEmpty
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: obats
                                        .map((obat) => Padding(
                                              padding: EdgeInsets.only(
                                                  left: obat == obats.first
                                                      ? 2
                                                      : 15,
                                                  right: obat == obats.last
                                                      ? 2
                                                      : 0),
                                              child: obatCard(obat, ref),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : const Center(
                                  child: Text('Tidak ada rekomendasi obat')),
                          orElse: () =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        verticalSpaces(8),
                        const Text('Kategori', style: TextStyle(fontSize: 18)),
                        verticalSpaces(14),
                        kategori.maybeWhen(
                          data: (kategoris) {
                            final displayedKategoris =
                                kategoris.take(8).toList();
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
                                  return categoryObatItem(
                                    ref,
                                    context,
                                    const KategoriObat(
                                        id: '99',
                                        nama: 'Lainnya',
                                        icon: 'assets/lainnya.png'),
                                    isLainnya: true,
                                  );
                                } else {
                                  return categoryObatItem(
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
          ),
          if (isVisible) popUpCart(cartProviderWatch, 5, ref),
        ],
      ),
    );
  }
}
