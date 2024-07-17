import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/ui/page/chat_page/dokter_card.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/search_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _hasSearched = false;
  bool _isSearching = false;
  String _selectedGender = 'Jenis Kelamin';
  String _selectedSorting = 'Urutkan';
  String _selectedExperience = 'Pengalaman';

  List<Dokter> _filteredDokters = [];

  @override
  void initState() {
    super.initState();
    // Focus on search field and show keyboard
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _search(String query) {
    setState(() {
      _hasSearched = true;
    });
    ref.read(searchDokterProvider.notifier).searchDokter(query);
  }

  @override
  Widget build(BuildContext context) {
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
            title: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Cari nama dokter atau spesialis',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
              ),
              onSubmitted: (query) {
                _search(query);
              },
              onChanged: (value) => setState(() {
                _isSearching = value.isNotEmpty;
              }),
            ),
            actions: [
              if (!_isSearching)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _search(_searchController.text);
                    },
                  ),
                ),
              if (_isSearching)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                        _searchController.clear();
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        FocusScope.of(context).requestFocus(_searchFocusNode);
                      });
                    },
                  ),
                ),
            ],
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              _hasSearched
                  ? searchResults.when(
                      data: (dokters) {
                        if (dokters.isEmpty) {
                          return const Center(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 220),
                                  child: Text('Tidak ada hasil ditemukan')));
                        }
                        _filteredDokters = _filterDokters(dokters);
                        return Column(
                          children: [
                            const SizedBox(height: 16),
                            _buildFilterSection(),
                            const SizedBox(height: 8),
                            _buildDokterList(_filteredDokters),
                          ],
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                    )
                  : const Text(''),
            ]),
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
        return DokterCard(dokter: dokters[index]);
      },
    );
  }
}
