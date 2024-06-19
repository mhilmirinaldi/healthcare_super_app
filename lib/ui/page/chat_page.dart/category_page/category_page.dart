import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_dokter_by_kategori_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final KategoriDokter kategori;

  const CategoryPage(this.kategori, {super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final listDokter = ref.watch(ListDokterByKategoriProvider(idKategori: widget.kategori.id));

    log(listDokter.toString());


    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => ref.read(routerProvider).pop(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          widget.kategori.name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 24),
        children: [
          
        ],
      ),
    );
  }
}
