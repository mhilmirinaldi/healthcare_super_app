import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class TransaksiCard extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const TransaksiCard({super.key, required this.transaksi});

  @override
  ConsumerState<TransaksiCard> createState() => _TransaksiCardState();
}

class _TransaksiCardState extends ConsumerState<TransaksiCard> {
  @override
  Widget build(BuildContext context) {
    // final kategoriFaskes = ref.watch(listRekomendasiFaskesProvider);

    return GestureDetector(
      onTap: () {
        if (widget.transaksi.kategori == 'chat') {
          ref
              .read(routerProvider)
              .pushNamed('chat_room', extra: widget.transaksi);
        } else if (widget.transaksi.kategori == 'faskes') {
          ref
              .read(routerProvider)
              .pushNamed('detail_pesanan_faskes', extra: widget.transaksi);
        } else {
          ref
              .read(routerProvider)
              .pushNamed('detail_transaksi', extra: widget.transaksi);
        }
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
                        size: widget.transaksi.kategori == 'obat' ? 15 : 17,
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
                    width: 75,
                    height: 80,
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
                            const SizedBox(height: 4),
                            Text(
                              widget.transaksi.totalHarga.toIDRCurrency(),
                              style: const TextStyle(fontSize: 14),
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
                                // kategoriFaskes.when(
                                //   data: (faskes) {
                                //     if (faskes.isEmpty) {
                                //       return const Center(
                                //           child: Padding(
                                //               padding:
                                //                   EdgeInsets.only(top: 220),
                                //               child: Text(
                                //                   'Tidak ada hasil ditemukan')));
                                //     } else {
                                //       // filter faskes by name
                                //       final faskesSort = faskes
                                //           .where((element) =>
                                //               element.nama ==
                                //               widget.transaksi.dokter!
                                //                   .tempatPraktik)
                                //           .toList();
                                //       return Text(
                                //         faskesSort[0].kategori,
                                //         style: TextStyle(
                                //             fontSize: 14,
                                //             color: Colors.grey[800]),
                                //       );
                                //     }
                                //   },
                                //   loading: () => const Center(
                                //       child: CircularProgressIndicator()),
                                //   error: (error, stack) =>
                                //       Center(child: Text('Error: $error')),
                                // ),
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
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.transaksi.totalHarga.toIDRCurrency(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 247,
                                  child: Text(
                                    widget.transaksi.listObat!
                                        .map((e) => e.nama)
                                        .join(', '),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  // total all pcs of obat
                                  '${widget.transaksi.listObat!
                                          .map((e) => e.jumlah)
                                          .reduce((a, b) => a! + b!)} pcs',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[800]),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.transaksi.totalHarga.toIDRCurrency(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
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
