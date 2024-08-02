import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_dokter.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/list_dokter_by_kategori_provider.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/search_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/dokter_card.dart';

class CategoryDokterPage extends ConsumerStatefulWidget {
  final KategoriDokter kategori;

  const CategoryDokterPage(this.kategori, {super.key});

  @override
  ConsumerState<CategoryDokterPage> createState() => _CategoryDokterPageState();
}

class _CategoryDokterPageState extends ConsumerState<CategoryDokterPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;
  bool _hasSearched = false;
  String _selectedGender = 'Jenis Kelamin';
  String _selectedSorting = 'Urutkan';
  String _selectedExperience = 'Pengalaman';

  List<Dokter> _filteredDokters = [];

  @override
  Widget build(BuildContext context) {
    final listDokter =
        ref.watch(ListDokterByKategoriProvider(idKategori: widget.kategori.id));
    final searchResults = ref.watch(searchDokterProvider);

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
            title: Row(
              children: [
                if (!_isSearching)
                  Expanded(
                    child: Text(
                      widget.kategori.name,
                      style: const TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (_isSearching)
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Cari nama dokter',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (query) {
                        setState(() {
                          _hasSearched = true;
                        });
                        ref
                            .read(searchDokterProvider.notifier)
                            .searchDokterWithKategori(
                                query, widget.kategori.id);
                      },
                    ),
                  ),
              ],
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
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 16),
                _buildFilterSection(),
                const SizedBox(height: 8),
                !_hasSearched
                    ? listDokter.when(
                        data: (dokters) {
                          if (dokters.isEmpty) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 220),
                                    child: Text('Tidak ada hasil ditemukan')));
                          }
                          _filteredDokters = _filterDokters(dokters);
                          return _buildDokterList(_filteredDokters);
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                      )
                    : searchResults.when(
                        data: (dokters) {
                          if (dokters.isEmpty) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 220),
                                    child: Text('Tidak ada hasil ditemukan')));
                          }
                          _filteredDokters = _filterDokters(dokters);
                          return _buildDokterList(_filteredDokters);
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
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildDropdown(
                'Jenis Kelamin',
                ['Jenis Kelamin', 'Laki-laki', 'Perempuan'],
                _selectedGender, (value) {
              if (value != null) {
                setState(() {
                  _selectedGender = value;
                  _filteredDokters = _filterDokters(_filteredDokters);
                });
              }
            }, 130),
            const SizedBox(width: 9),
            _buildDropdown(
                'Pengalaman',
                ['Pengalaman', '< 5 tahun', '5 - 10 tahun', '> 10 tahun'],
                _selectedExperience, (value) {
              if (value != null) {
                setState(() {
                  _selectedExperience = value;
                  _filteredDokters = _filterDokters(_filteredDokters);
                });
              }
            }, 121),
            const SizedBox(width: 9),
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
                  _filteredDokters = _filterDokters(_filteredDokters);
                });
              }
            }, 97),
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

  List<Dokter> _filterDokters(List<Dokter> dokters) {
    List<Dokter> filteredList = dokters;

    if (_selectedGender != 'Jenis Kelamin') {
      filteredList = filteredList
          .where((dokter) => dokter.jenisKelamin == _selectedGender)
          .toList();
    }

    if (_selectedExperience != 'Pengalaman') {
      filteredList = filteredList.where((dokter) {
        if (_selectedExperience == '< 5 tahun') {
          return dokter.lamaKerja < 5;
        } else if (_selectedExperience == '5 - 10 tahun') {
          return dokter.lamaKerja >= 5 && dokter.lamaKerja <= 10;
        } else if (_selectedExperience == '> 10 tahun') {
          return dokter.lamaKerja > 10;
        }
        return true;
      }).toList();
    }

    switch (_selectedSorting) {
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

  Widget _buildDokterList(List<Dokter> dokters) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: dokters.length,
      itemBuilder: (context, index) {
        return dokterCard(ref, dokters[index]);
      },
    );
  }
}
