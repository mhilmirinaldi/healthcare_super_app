import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/ui/page/faskes_page/faskes_card.dart';
import 'package:super_app_telemedicine/ui/provider/faskes/search_faskes_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class SearchFaskesPage extends ConsumerStatefulWidget {
  const SearchFaskesPage({super.key});

  @override
  ConsumerState<SearchFaskesPage> createState() => _SearchFaskesPageState();
}

class _SearchFaskesPageState extends ConsumerState<SearchFaskesPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _hasSearched = false;
  bool _isSearching = false;
  String _selectedKategori = 'Kategori';
  String _selectedSorting = 'Urutkan';

  List<Faskes> _filteredFaskes = [];

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
    ref.read(searchFaskesProvider.notifier).searchFaskes(query);
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(searchFaskesProvider);

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
                hintText: 'Cari nama fasilitas kesehatan',
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
            child: ListView(
              children: [
                _hasSearched
                    ? searchResults.when(
                            data: (faskes) {
                              if (faskes.isEmpty) {
                                return const Center(
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 220),
                                        child:
                                            Text('Tidak ada hasil ditemukan')));
                              }
                              _filteredFaskes = _filterFaskes(faskes);
                              return Column(
                                children: [
                                  const SizedBox(height: 16),
                                  _buildFilterSection(),
                                  const SizedBox(height: 8),
                                  _buildFaskesList(_filteredFaskes),
                                ],
                              );
                            },
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (error, stack) =>
                                Center(child: Text('Error: $error')),
                          )
                        : const Text(''),
              ],
            ),
          ),
        ],
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
                  'Rumah Sakit Umum',
                  'Rumah Sakit Khusus Jantung',
                  'Rumah Sakit Khusus Ibu dan Anak',
                  'Klinik Kesehatan',
                  'Laboratorium',
                ],
                _selectedKategori, (value) {
              if (value != null) {
                setState(() {
                  _selectedKategori = value;
                  _filteredFaskes = _filterFaskes(_filteredFaskes);
                });
              }
            }, 178),
            const SizedBox(width: 9),
            _buildDropdown(
                'Urutkan',
                [
                  'Urutkan',
                  'Terdekat',
                  'Terjauh',
                ],
                _selectedSorting, (value) {
              if (value != null) {
                setState(() {
                  _selectedSorting = value;
                  _filteredFaskes = _filterFaskes(_filteredFaskes);
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

  List<Faskes> _filterFaskes(List<Faskes> faskes) {
    List<Faskes> filteredList = faskes;

    if (_selectedKategori != 'Kategori') {
      filteredList = filteredList
          .where((faskes) => faskes.kategori == _selectedKategori)
          .toList();
    }

    switch (_selectedSorting) {
      case 'Terjauh':
        filteredList.sort((a, b) => (b.jarak).compareTo(a.jarak));
        break;
      case 'Terdekat':
        filteredList.sort((a, b) => (a.jarak).compareTo(b.jarak));
        break;
    }

    return filteredList;
  }

  Widget _buildFaskesList(List<Faskes> faskess) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.65,
      ),
      itemCount: faskess.length,
      itemBuilder: (context, index) {
        return FaskesCard(faskes: faskess[index]);
      },
    );
  }
}
