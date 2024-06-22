import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';

import '../../provider/router/router_provider.dart';

Widget categoryItem(WidgetRef ref, BuildContext context, KategoriDokter kategori, {bool isLainnya = false}){
  return GestureDetector(
      onTap: () {
        if (isLainnya) {
          ref.read(routerProvider).pushNamed('lainnya');
        } else {
          ref.read(routerProvider).pushNamed('category', extra: kategori);
        }
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[50],
            ),
            child: Image.asset(
              kategori.icon ?? 'assets/lainnya.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            kategori.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ],
      ),
    );
}