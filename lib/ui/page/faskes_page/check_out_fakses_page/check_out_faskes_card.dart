import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/search_faskes_provider.dart';

class CheckoutFaskesCard extends ConsumerStatefulWidget {
  final Dokter dokter;
  final Transaksi transaksi;

  const CheckoutFaskesCard(
      {super.key, required this.dokter, required this.transaksi});

  @override
  ConsumerState<CheckoutFaskesCard> createState() => _CheckoutFaskesCardState();
}

class _CheckoutFaskesCardState extends ConsumerState<CheckoutFaskesCard> {
  @override
  void initState() {
    super.initState();
    // search faskes by dokter
    Future.delayed(Duration.zero, () {
      ref
          .read(searchFaskesProvider.notifier)
          .searchFaskes(widget.dokter.tempatPraktik);
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchFaskesProvider);

    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    image: widget.dokter.gambar == null ||
                            widget.dokter.gambar!.isEmpty
                        ? widget.dokter.jenisKelamin == 'Laki-laki'
                            ? const AssetImage(
                                'assets/default_profile_doctor_male.png')
                            : const AssetImage(
                                'assets/default_profile_doctor_female.png')
                        : NetworkImage(widget.dokter.gambar!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dokter.nama,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.dokter.kategori,
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 15, color: Colors.orange),
                      const SizedBox(width: 1),
                      Text(
                        widget.dokter.ratingTotal.toString(),
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.work, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 2),
                      Text(
                        '${widget.dokter.lamaKerja} Tahun',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  image: DecorationImage(
                    image: widget.dokter.gambar == null ||
                            widget.dokter.gambar!.isEmpty
                        ? const AssetImage('assets/default_hospital_2.png')
                        : NetworkImage(widget.dokter.gambar!) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dokter.tempatPraktik,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  searchResults.when(
                    data: (dokters) {
                      if (dokters.isEmpty) {
                        return const Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 220),
                                child: Text('Tidak ada hasil ditemukan')));
                      }
                      return Text(
                        dokters[0].kategori,
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 15, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        formatDate(DateTime.fromMillisecondsSinceEpoch(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
