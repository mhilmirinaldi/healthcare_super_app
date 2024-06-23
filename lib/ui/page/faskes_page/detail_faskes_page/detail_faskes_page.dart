import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/ui/extension/str_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/detail_faskes_page/dokter_faskes_card.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/detail_faskes_page/info_row.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailFaskesPage extends ConsumerStatefulWidget {
  final Faskes faskes;

  const DetailFaskesPage({super.key, required this.faskes});

  @override
  ConsumerState<DetailFaskesPage> createState() => _DetailFaskesPageState();
}

class _DetailFaskesPageState extends ConsumerState<DetailFaskesPage> {
  String selectedFilter = 'Urutkan';
  String selectedGender = 'Jenis Kelamin';
  String selectedSpesialis = 'Spesialis';
  List<String> kategoriList = [];

  @override
  void initState() {
    super.initState();
    _extractKategoriList();
  }

  void _extractKategoriList() {
    kategoriList = widget.faskes.listDokter.map((dokter) => dokter.kategori).toSet().toList();
    kategoriList.insert(0, 'Spesialis');
  }

  List<Dokter> getFilteredDokters() {
    List<Dokter> filteredList = List.from(widget.faskes.listDokter);

    if (selectedGender != 'Jenis Kelamin') {
      filteredList = filteredList
          .where((dokter) => dokter.jenisKelamin == selectedGender)
          .toList();
    }

    if (selectedSpesialis != 'Spesialis') {
      filteredList = filteredList
          .where((dokter) => dokter.kategori == selectedSpesialis)
          .toList();
    }

    switch (selectedFilter) {
      case 'Harga tertinggi':
        filteredList.sort((a, b) => (b.harga).compareTo(a.harga));
        break;
      case 'Harga terendah':
        filteredList.sort((a, b) => (a.harga).compareTo(b.harga));
        break;
      case 'Rating tertinggi':
        filteredList.sort((a, b) => (b.ratingTotal).compareTo(a.ratingTotal));
        break;
      case 'Rating terendah':
        filteredList.sort((a, b) => (a.ratingTotal).compareTo(b.ratingTotal));
        break;
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    List<Dokter> filteredList = getFilteredDokters();

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
                    image: widget.faskes.gambar == null ||
                            widget.faskes.gambar!.isEmpty
                        ? const AssetImage(
                            'assets/default_hospital_transparent.png')
                        : NetworkImage(widget.faskes.gambar!) as ImageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.faskes.nama.capitalize(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.faskes.kategori,
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
                        const Icon(Icons.location_on,
                            size: 16, color: primaryColor),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.faskes.jarak} km',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              infoRow('Alamat', widget.faskes.alamat, ''),
              const SizedBox(height: 8),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                child: const Text(
                  'Cari Dokter',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 119,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: selectedSpesialis,
                      items: kategoriList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 13),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            selectedSpesialis = newValue;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 131,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: selectedGender,
                      items: <String>[
                        'Jenis Kelamin',
                        'Laki-laki',
                        'Perempuan',
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 13),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            selectedGender = newValue;
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 100,
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
                        'Harga tertinggi',
                        'Harga terendah',
                        'Rating tertinggi',
                        'Rating terendah',
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 13),
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
              const SizedBox(height: 4),
              ...filteredList.map((rev) => DokterFaskesCard(
                    dokter: rev,
                  )),

              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}

