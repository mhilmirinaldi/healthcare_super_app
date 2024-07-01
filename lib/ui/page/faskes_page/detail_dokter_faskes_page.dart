import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/review.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/detail_dokter_page/info_row.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/detail_dokter_page/review_card.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/jadwal_item.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/user_data/user_data_provider.dart';

class DetailDokterFaskesPage extends ConsumerStatefulWidget {
  final Dokter dokter;

  const DetailDokterFaskesPage({super.key, required this.dokter});

  @override
  ConsumerState<DetailDokterFaskesPage> createState() =>
      _DetailDokterFaskesPageState();
}

class _DetailDokterFaskesPageState
    extends ConsumerState<DetailDokterFaskesPage> {
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

  final List<DateTime> dates = List.generate(4, (index) {
    DateTime now = DateTime.now();
    // convert to indonesia languange

    DateTime date = DateTime(now.year, now.month, now.day);
    return date.add(Duration(days: index));
  });

  final List<int> hours = List.generate(4, (index) => index + 12);

  DateTime? selectedDate;
  int? selectedHour;

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
                    image: widget.dokter.gambar == null ||
                            widget.dokter.gambar!.isEmpty
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
                widget.dokter.nama,
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
              const SizedBox(height: 12),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                child: const Text(
                  'Jadwal',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 18),
              ...jadwalItem(
                jadwalItem: dates,
                selectedItem: selectedDate,
                converter: (date) => DateFormat('EEE, d MMM y').format(date),
                onTap: (object) => setState(() {
                  selectedDate = object;
                  selectedHour = null;
                }),
                isDate: true,
              ),
              const SizedBox(height: 14),
              const Text(
                'Waktu',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 8),
              ...jadwalItem(
                  jadwalItem: hours,
                  selectedItem: selectedHour,
                  converter: (object) => '$object:00',
                  isOptionEnable: (hour) =>
                      selectedDate != null &&
                      DateTime(selectedDate!.year, selectedDate!.month,
                              selectedDate!.day, hour)
                          .isAfter(DateTime.now()),
                  onTap: (object) => setState(() {
                        selectedHour = object;
                      }),
                  isDate: false),
              const SizedBox(height: 16),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                child: const Text(
                  'Review',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 12),
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
                      Container(
                        height: 30,
                        width: 90,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
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
                                      style: const TextStyle(fontSize: 13.5),
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
                                        style: const TextStyle(fontSize: 13.5),
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
                      Container(
                        height: 30,
                        width: 148,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
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
                                style: const TextStyle(fontSize: 13.5),
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
              const SizedBox(height: 6),
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
                if (selectedDate != null && selectedHour != null) {
                  Transaksi transaksi = Transaksi(
                    idUser: ref.read(userDataProvider).value!.id,
                    judul: 'Buat Janji Temu',
                    kategori: 'faskes',
                    totalHarga: (6000 + widget.dokter.harga),
                    dokter: widget.dokter,
                    waktuJanji: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedHour!,
                    ).millisecondsSinceEpoch,
                  );

                  ref
                      .read(routerProvider)
                      .pushNamed('check_out_faskes', extra: transaksi);
                } else {
                  log('Chat button disabled');
                }
              },
              style: selectedDate != null && selectedHour != null
                  ? ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFFE1004E)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24)),
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )
                  : ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24)),
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
              child: Text(
                'Daftar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedDate != null && selectedHour != null
                        ? Colors.white
                        : Colors.grey[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
