import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/domain/entity/kategori_obat.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/obat_card.dart';
import 'package:super_app_telemedicine/ui/provider/obat/list_obat_by_kategori_provider.dart';
import 'package:super_app_telemedicine/ui/provider/obat/search_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class CategoryObatPage extends ConsumerStatefulWidget {
  final KategoriObat kategori;

  const CategoryObatPage(this.kategori, {super.key});

  @override
  ConsumerState<CategoryObatPage> createState() => _CategoryObatPageState();
}

class _CategoryObatPageState extends ConsumerState<CategoryObatPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;
  bool _hasSearched = false;
  String _selectedSorting = 'Urutkan';

  List<Obat> _filteredObats = [];

  @override
  Widget build(BuildContext context) {
    final listObat =
        ref.watch(ListObatByKategoriProvider(idKategori: widget.kategori.id));
    final searchResults = ref.watch(searchObatProvider);

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
                      widget.kategori.nama,
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
                        hintText: 'Cari obat',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (query) {
                        setState(() {
                          _hasSearched = true;
                        });
                        ref
                            .read(searchObatProvider.notifier)
                            .searchObatWithKategori(
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
                    ? listObat.when(
                        data: (obats) {
                          if (obats.isEmpty) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 220),
                                    child: Text('Tidak ada hasil ditemukan')));
                          }
                          _filteredObats = _filterObats(obats);
                          return _buildObatList(_filteredObats);
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, stack) =>
                            Center(child: Text('Error: $error')),
                      )
                    : searchResults.when(
                        data: (obats) {
                          if (obats.isEmpty) {
                            return const Center(
                                child: Padding(
                                    padding: EdgeInsets.only(top: 220),
                                    child: Text('Tidak ada hasil ditemukan')));
                          }
                          _filteredObats = _filterObats(obats);
                          return _buildObatList(_filteredObats);
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 9),
            _buildDropdown(
                'Urutkan',
                [
                  'Urutkan',
                  'Harga tertinggi',
                  'Harga terendah',
                ],
                _selectedSorting, (value) {
              if (value != null) {
                setState(() {
                  _selectedSorting = value;
                  _filteredObats = _filterObats(_filteredObats);
                });
              }
            }, 130),
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

  List<Obat> _filterObats(List<Obat> obats) {
    List<Obat> filteredList = obats;

    switch (_selectedSorting) {
      case 'Harga tertinggi':
        filteredList.sort((a, b) => (b.harga).compareTo(a.harga));
        break;
      case 'Harga terendah':
        filteredList.sort((a, b) => (a.harga).compareTo(b.harga));
        break;
    }

    return filteredList;
  }

  Widget _buildObatList(List<Obat> obats) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 24),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      childAspectRatio: 0.6,
    ),
    itemCount: obats.length,
    itemBuilder: (context, index) {
      return ObatCard(obat: obats[index]);
    },
  );
}

}
