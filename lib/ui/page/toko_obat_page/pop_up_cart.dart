import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';

Widget popUpCart(CartProvider cartProviderWatch, double bottom) {
  return Positioned(
    bottom: bottom,
    left: 0,
    right: 0,
    child: GestureDetector(
      onTap: () {
        log('Cart Clicked');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 55,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            color: primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${cartProviderWatch.totalItems} Barang | Rp ${cartProviderWatch.items.fold<int>(0, (previousValue, element) => previousValue + (element.harga * element.jumlah!)).toIDRCurrency()}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Keranjang',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
