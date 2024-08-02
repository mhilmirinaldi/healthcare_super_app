import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

Widget checkoutItemCard (Obat obat, WidgetRef ref){
  return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          ref.read(routerProvider).pushNamed('detail_obat', extra: obat);
        },
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                      image: obat.gambar == null || obat.gambar!.isEmpty
                          ? const AssetImage('assets/default_medicine.png')
                          : NetworkImage(obat.gambar!) as ImageProvider,
                      fit: BoxFit.cover)),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 195,
                  child: Text(
                    obat.nama,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  obat.harga.toIDRCurrency(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                // const SizedBox(height: 10),
              ],
            ),
            const Spacer(),
            // Text(
            //   'x${obat.jumlah}',
            //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            // ),
            SizedBox(
              height: 35,
              width: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(cartProvider).removeItem(obat.id);
                      },
                      child: const Center(
                        child: Icon(Icons.remove,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('${obat.jumlah}', style: const TextStyle(fontSize: 14)),
                  const SizedBox(width: 12),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(cartProvider).addItem(obat);
                      },
                      child: const Center(
                        child: Icon(Icons.add,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
}
