import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_spesialis.dart';

import '../../provider/router/router_provider.dart';

Widget categorySpesialisItem(
    WidgetRef ref, BuildContext context, KategoriSpesialis kategori,
    {bool isLainnya = false}) {
  return GestureDetector(
    onTap: () {
      if (isLainnya) {
        ref.read(routerProvider).pushNamed('lainnya_spesialis');
      } else {
        ref.read(routerProvider).pushNamed('category_spesialis', extra: kategori);
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
          kategori.nama,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Colors.black),
        ),
      ],
    ),
  );
}
