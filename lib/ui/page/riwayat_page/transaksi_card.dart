import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/search_faskes_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class TransaksiCard extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const TransaksiCard({super.key, required this.transaksi});

  @override
  ConsumerState<TransaksiCard> createState() => _TransaksiCardState();
}

class _TransaksiCardState extends ConsumerState<TransaksiCard> {
  @override
  void initState() {
    super.initState();
    // search faskes by dokter
    Future.delayed(Duration.zero, () {
      ref
          .read(searchFaskesProvider.notifier)
          .searchFaskes(widget.transaksi.dokter!.tempatPraktik);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchFaskesProvider);
    log(searchResults.toString());

    return GestureDetector(
      onTap: () {
        ref.read(routerProvider).pushNamed('');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.transaksi.kategori == 'chat'
                            ? Icons.wechat
                            : widget.transaksi.kategori == 'faskes'
                                ? Icons.add_location_rounded
                                : Icons.medical_services,
                        color: primaryColor,
                        size: 17,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.transaksi.judul,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    formatTransaksi(
                      DateTime.fromMillisecondsSinceEpoch(
                          widget.transaksi.waktuTransaksi!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey, width: 1),
                        image: DecorationImage(
                            image: widget.transaksi.kategori == 'chat'
                                ? widget.transaksi.dokter!.jenisKelamin ==
                                        'Laki-laki'
                                    ? const AssetImage(
                                        'assets/default_profile_doctor_male.png')
                                    : const AssetImage(
                                        'assets/default_profile_doctor_female.png')
                                : widget.transaksi.kategori == 'faskes'
                                    ? const AssetImage(
                                        'assets/default_hospital_2.png')
                                    : const AssetImage(
                                        'assets/default_medicine_transparent 2.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 12),
                  widget.transaksi.kategori == 'chat'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.transaksi.dokter!.nama,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.transaksi.dokter!.kategori,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[800]),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 15, color: Colors.orange),
                                const SizedBox(width: 1),
                                Text(
                                  widget.transaksi.dokter!.ratingTotal
                                      .toString(),
                                  style: const TextStyle(fontSize: 13),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.work,
                                    size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 2),
                                Text(
                                  '${widget.transaksi.dokter!.lamaKerja} Tahun',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        )
                      : widget.transaksi.kategori == 'faskes'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.transaksi.dokter!.tempatPraktik,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                
                                Row(
                                  children: [
                                    Icon(Icons.date_range,
                                        size: 15, color: Colors.grey[600]),
                                    const SizedBox(width: 4),
                                    Text(
                                      formatDate(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              widget.transaksi.waktuJanji!)),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        size: 14, color: Colors.grey[600]),
                                    const SizedBox(width: 2),
                                    Text(
                                        formateTime(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              widget.transaksi.waktuJanji!),
                                        ),
                                        style: const TextStyle(fontSize: 13)),
                                  ],
                                )
                              ],
                            )
                          : Text('data'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
