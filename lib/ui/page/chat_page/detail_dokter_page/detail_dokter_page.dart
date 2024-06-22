import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/review.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/extension/str_extension.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/detail_dokter_page/info_row.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/detail_dokter_page/review_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailDokterPage extends ConsumerStatefulWidget {
  final Dokter dokter;

  const DetailDokterPage({super.key, required this.dokter});

  @override
  ConsumerState<DetailDokterPage> createState() => _DetailDokterPageState();
}

class _DetailDokterPageState extends ConsumerState<DetailDokterPage> {
  String selectedFilter = 'Urutkan';
  String selectedRating = 'Rating';

  List<Review> getFilteredReviews() {
    List<Review> reviews = List.from(widget.dokter.review);

    if (selectedRating != 'Rating') {
      int rating = int.parse(selectedRating[0]);
      reviews = reviews.where((review) => review.rating == rating).toList();
    }

    if (selectedFilter == 'Rating Tertinggi') {
      reviews.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (selectedFilter == 'Rating Terendah') {
      reviews.sort((a, b) => a.rating.compareTo(b.rating));
    } else if (selectedFilter == 'Terbaru') {
      DateFormat inputFormat = DateFormat('dd-MM-yyyy');
      reviews.sort((a, b) {
        DateTime dateA = inputFormat.parse(a.tanggal ?? '');
        DateTime dateB = inputFormat.parse(b.tanggal ?? '');
        return dateB.compareTo(dateA);
      });
    }

    return reviews;
  }

  @override
  Widget build(BuildContext context) {
    List<Review> filteredReviews = getFilteredReviews();

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
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 4, bottom: 24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFFCCD8EF),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: widget.dokter.gambar == null || widget.dokter.gambar!.isEmpty
                            ? widget.dokter.jenisKelamin == 'Laki-laki'
                                ? const AssetImage(
                                    'assets/default_profile_doctor_male_transparent.png')
                                : const AssetImage(
                                    'assets/default_profile_doctor_female_transparent.png')
                            : NetworkImage(widget.dokter.gambar!) as ImageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.dokter.nama.capitalize(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.dokter.kategori,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.only(
                        left: 2, right: 4, top: 1, bottom: 1),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          widget.dokter.ratingTotal.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.only(
                        left: 3, right: 5, top: 1, bottom: 1),
                    child: Row(
                      children: [
                        Icon(Icons.work, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.dokter.lamaKerja} Tahun',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              infoRow('Alumnus', widget.dokter.alumnus, 'assets/alumnus.png'),
              const SizedBox(height: 8),
              infoRow('Tempat Praktik', widget.dokter.tempatPraktik,
                  'assets/tempat_praktik.png'),
              const SizedBox(height: 8),
              infoRow(
                  'Nomor STR', widget.dokter.nomorStr, 'assets/nomor_str.png'),
              const SizedBox(height: 16),
              const Text(
                'Review',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        widget.dokter.ratingTotal.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Text(
                        ' / 5.0',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: DropdownButton<String>(
                          value: selectedRating,
                          items: <String>[
                            'Rating',
                            '5 Bintang',
                            '4 Bintang',
                            '3 Bintang',
                            '2 Bintang',
                            '1 Bintang'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: value == 'Rating'
                                  ? Text(
                                      value,
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  : Row(children: [
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.orange,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        ('${value[0]}.0'),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ]),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue != null) {
                                selectedRating = newValue;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 40,
                        child: DropdownButton<String>(
                          value: selectedFilter,
                          items: <String>[
                            'Urutkan',
                            'Rating Tertinggi',
                            'Rating Terendah',
                            'Terbaru'
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue != null) {
                                selectedFilter = newValue;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ...filteredReviews.map((rev) => reviewCard(rev)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Biaya Konsultasi'),
                const SizedBox(height: 4),
                Text(
                  widget.dokter.harga.toIDRCurrency(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                log('Chat button on tap');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFE1004E)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
                minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Chat',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
