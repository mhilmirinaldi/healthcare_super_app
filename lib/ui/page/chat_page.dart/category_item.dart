import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';

Widget categoryItem(BuildContext context, KategoriDokter kategori, {bool isLainnya = false}){
  return GestureDetector(
      onTap: () {
        if (isLainnya) {
          log('Navigate to full categories list');
        } else {
          log('Selected category: ${kategori.name}');
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