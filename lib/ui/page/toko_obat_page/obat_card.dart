import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/cart/cart_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class ObatCard extends ConsumerWidget {
  final Obat obat;

  const ObatCard({super.key, required this.obat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final itemCount = cart.getItemCount(obat.id);

    return GestureDetector(
      onTap: () {
        ref.read(routerProvider).pushNamed('detail_obat', extra: obat);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 155,
        height: 290,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    image: obat.gambar == null || obat.gambar!.isEmpty
                        ? const AssetImage('assets/default_medicine.png')
                        : NetworkImage(obat.gambar!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    child: Text(
                      obat.nama,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(obat.satuan,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                  const SizedBox(height: 2),
                  Text(
                    obat.harga.toIDRCurrency(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  itemCount > 0
                      ? SizedBox(
                          height: 35,
                          width: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove,
                                      size: 18, color: Colors.white),
                                  onPressed: () {
                                    ref.read(cartProvider).removeItem(obat.id);
                                  },
                                ),
                              ),
                              Text('$itemCount',
                                  style: const TextStyle(fontSize: 14)),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add,
                                      size: 18, color: Colors.white),
                                  onPressed: () {
                                    ref.read(cartProvider).addItem(obat);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 35,
                          width: 125,
                          child: ElevatedButton(
                            onPressed: () {
                              ref.read(cartProvider).addItem(obat);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFE1004E)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 37)),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(0, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              'Tambah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
