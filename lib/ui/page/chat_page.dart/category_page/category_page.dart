import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_dokter_by_kategori_provider.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/search_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/dokter_card.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final KategoriDokter kategori;

  const CategoryPage(this.kategori, {super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;
  bool _hasSearched = false;
  String _selectedGender = 'Semua';
  String _selectedSorting = 'Urutkan';
  String _selectedExperience = 'Pengalaman';

  @override
  Widget build(BuildContext context) {
    final listDokter =
        ref.watch(ListDokterByKategoriProvider(idKategori: widget.kategori.id));
    final searchResults = ref.watch(searchDokterProvider);

    return Scaffold(
      appBar: AppBar(
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
        title: _isSearching
            ? TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Cari dokter',
                  border: InputBorder.none,
                ),
                onSubmitted: (query) {
                  setState(() {
                    _hasSearched = true;
                  });
                  ref.read(searchDokterProvider.notifier).searchDokterWithKategori(query, widget.kategori.id);
                },
              )
            : Text(
                widget.kategori.name,
                style: const TextStyle(fontSize: 18),
              ),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  FocusScope.of(context).requestFocus(_searchFocusNode);
                });
              },
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchController.clear();
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildFilterSection(),
          const SizedBox(height: 16),
          Expanded(
            child: !_hasSearched ? listDokter.when(
              data: (dokters) {
                if (dokters.isEmpty) {
                  return const Center(child: Text('Tidak ada hasil ditemukan'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: dokters.length,
                  itemBuilder: (context, index) {
                    return DokterCard(dokter: dokters[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ) : searchResults.when(
              data: (dokters) {
                if (dokters.isEmpty) {
                  return const Center(child: Text('Tidak ada hasil ditemukan'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                  itemCount: dokters.length,
                  itemBuilder: (context, index) {
                    return DokterCard(dokter: dokters[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDropdown('Jenis Kelamin', ['Semua', 'Laki-laki', 'Perempuan'],
              _selectedGender, (value) {
            if (value != null) {
              setState(() {
                _selectedGender = value;
              });
              // Lakukan filter berdasarkan jenis kelamin
            }
          }),
          const SizedBox(width: 8),
          _buildDropdown(
              'Urutkan',
              [
                'Urutkan',
                'Harga tertinggi',
                'Harga terendah',
                'Rating tertinggi',
                'Rating terendah'
              ],
              _selectedSorting, (value) {
            if (value != null) {
              setState(() {
                _selectedSorting = value;
              });
              // Lakukan pengurutan
            }
          }),
          const SizedBox(width: 8),
          _buildDropdown(
              'Pengalaman',
              ['Pengalaman', '< 5 tahun', '5 - 10 tahun', '> 10 tahun'],
              _selectedExperience, (value) {
            if (value != null) {
              setState(() {
                _selectedExperience = value;
              });
              // Lakukan filter berdasarkan pengalaman
            }
          }),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedItem,
      ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,
                style: const TextStyle(
                    fontSize: 12)), // Adjust font size if necessary
          );
        }).toList(),
        underline: const SizedBox(), // Remove the underline
      ),
    );
  }
}
