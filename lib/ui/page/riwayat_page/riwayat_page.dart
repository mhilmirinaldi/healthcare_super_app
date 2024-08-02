import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/user_info.dart';
import 'package:super_app_telemedicine/ui/page/riwayat_page/transaksi_card.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';

class RiwayatPage extends ConsumerStatefulWidget {
  const RiwayatPage({super.key});

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends ConsumerState<RiwayatPage> {
  String _selectedSorting = 'Urutkan';
  String _selectedKategori = 'Kategori';
  List<Transaksi> _filteredTransaksi = [];

  @override
  Widget build(BuildContext context) {
    final listTransaksi = ref.watch(transaksiDataProvider);

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Riwayat Rekam Medis',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  // verticalSpaces(14),
                  // GestureDetector(
                  //   onTap: () {
                  //     ref.read(routerProvider).pushNamed('search_page');
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 16, vertical: 8),
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey[200],
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.search, color: Colors.grey[500]),
                  //         const SizedBox(width: 8),
                  //         Text(
                  //           'Cari transaksi',
                  //           style: TextStyle(color: Colors.grey[800]),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  verticalSpaces(8),
                  _buildFilterSection(),
                  verticalSpaces(8),
                  listTransaksi.when(
                    data: (transaksis) {
                      if (transaksis.isEmpty) {
                        return const Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 220),
                                child: Text('Tidak ada hasil ditemukan')));
                      }
                      transaksis.sort((a, b) =>
                        -a.waktuTransaksi!.compareTo(b.waktuTransaksi!));
                      _filteredTransaksi = _filterTransaksi(transaksis);
                      return _buildTransaksiList(_filteredTransaksi);
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildDropdown(
                'Kategori',
                [
                  'Kategori',
                  'Konsultasi Online',
                  'Buat Janji Temu',
                  'Pembelian Obat'
                ],
                _selectedKategori, (value) {
              if (value != null) {
                setState(() {
                  _selectedKategori = value;
                  _filteredTransaksi = _filterTransaksi(_filteredTransaksi);
                });
              }
            }, 178),
            const SizedBox(width: 9),
            _buildDropdown(
                'Urutkan',
                [
                  'Urutkan',
                  'Terbaru',
                  'Terlama',
                  'Harga tertinggi',
                  'Harga terendah'
                ],
                _selectedSorting, (value) {
              if (value != null) {
                setState(() {
                  _selectedSorting = value;
                  _filteredTransaksi = _filterTransaksi(_filteredTransaksi);
                });
              }
            }, 178),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem,
      ValueChanged<String?> onChanged, double width) {
    return Container(
      height: 40,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedItem,
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(fontSize: 13)),
          );
        }).toList(),
        underline: const SizedBox(),
      ),
    );
  }

  List<Transaksi> _filterTransaksi(List<Transaksi> transaksi) {
    List<Transaksi> filteredList = transaksi;

    if (_selectedKategori != 'Kategori') {
      filteredList = filteredList
          .where((transaksi) => transaksi.judul == _selectedKategori)
          .toList();
    }

    switch (_selectedSorting) {
      case 'Harga tertinggi':
        filteredList.sort((a, b) => (b.totalHarga).compareTo(a.totalHarga));
        break;
      case 'Harga terendah':
        filteredList.sort((a, b) => (a.totalHarga).compareTo(b.totalHarga));
        break;
      case 'Terbaru':
        filteredList
            .sort((a, b) => (b.waktuTransaksi!).compareTo(a.waktuTransaksi!));
        break;
      case 'Terlama':
        filteredList
            .sort((a, b) => (a.waktuTransaksi!).compareTo(b.waktuTransaksi!));
        break;
    }

    return filteredList;
  }

  Widget _buildTransaksiList(List<Transaksi> transaksi) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transaksi.length,
      itemBuilder: (context, index) {
        return transaksiCard(transaksi[index], ref);
      },
    );
  }
}
