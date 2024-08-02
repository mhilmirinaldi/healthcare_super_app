import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/misc/methods.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/chat_room_page/chat_rekam_medis_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/provider/transaksi_data/transaksi_data_provider.dart';

class ChatRekamMedisPage extends ConsumerStatefulWidget {
  final void Function(List<Transaksi>) onSelectedTransaksi;

  const ChatRekamMedisPage({super.key, required this.onSelectedTransaksi});

  @override
  ConsumerState<ChatRekamMedisPage> createState() => _ChatRekamMedisPageState();
}

class _ChatRekamMedisPageState extends ConsumerState<ChatRekamMedisPage> {
  final List<Transaksi> _selectedTransaksi = [];
  String _selectedSorting = 'Urutkan';
  String _selectedKategori = 'Kategori';
  List<Transaksi> _filteredTransaksi = [];

  @override
  Widget build(BuildContext context) {
    final listTransaksi = ref.watch(transaksiDataProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => ref.read(routerProvider).pop(),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Riwayat Rekam Medis',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        children: [
          Column(children: [
            verticalSpaces(8),
            _buildFilterSection(),
            verticalSpaces(8),
            listTransaksi.when(
              data: (transaksis) {
                if (transaksis.isEmpty) {
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150),
                      Center(child: Text("Belum ada transaksi")),
                    ],
                  );
                } 
                  transaksis.sort((a, b) =>
                      -a.waktuTransaksi!.compareTo(b.waktuTransaksi!));
                  transaksis = transaksis
                      .where((transaksi) => transaksi.status == 'selesai')
                      .toList();
                  _filteredTransaksi = _filterTransaksi(transaksis);
                  return _buildTransaksiList(_filteredTransaksi);
                
              },
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ]),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 0),
        child: ElevatedButton(
          onPressed: () {
            widget.onSelectedTransaksi(_selectedTransaksi);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Lampirkan',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
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
        return chatRekamMedisCard(
          transaksi: transaksi[index],
          onChanged: (bool? value) {
            // Update the callback type to bool?
            setState(() {
              if (value == true) {
                _selectedTransaksi.add(transaksi[index]);
              } else {
                _selectedTransaksi.remove(transaksi[index]);
              }
            });
          },
          isSelected: _selectedTransaksi.contains(transaksi[index]),
          ref: ref,
        );
      },
    );
  }
}
