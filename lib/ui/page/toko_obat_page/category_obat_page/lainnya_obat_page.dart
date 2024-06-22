import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/category_obat_item.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_kategori_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class LainnyaObatPage extends ConsumerWidget {
  const LainnyaObatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kategori = ref.watch(listKategoriObatProvider);

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
                Text(
                  'Kategori obat',
                  style: TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                kategori.maybeWhen(
                    data: (kategoris) {
                      final displayedKategoris = kategoris.toList();
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
                        itemCount: displayedKategoris.length,
                        itemBuilder: (context, index) {
                            return categoryObatItem(
                              ref,
                              context,
                              displayedKategoris[index],
                            );
                        },
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
