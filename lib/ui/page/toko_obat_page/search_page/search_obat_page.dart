import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/obat_card.dart';
import 'package:super_app_telemedicine/ui/provider/obat/search_obat_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class SearchObatPage extends ConsumerStatefulWidget {
  const SearchObatPage({super.key});

  @override
  ConsumerState<SearchObatPage> createState() => _SearchObatPageState();
}

class _SearchObatPageState extends ConsumerState<SearchObatPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _hasSearched = false;
  bool _isSearching = false;

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
    ref.read(searchObatProvider.notifier).searchObat(query);
  }

  @override
  Widget build(BuildContext context) {
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
            title: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Cari nama obat',
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
      body: _hasSearched
          ? searchResults.when(
              data: (obats) {
                if (obats.isEmpty) {
                  return const Center(child: Text('Tidak ada hasil ditemukan'));
                }
                return GridView.builder(
                  shrinkWrap: true,
                  
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: obats.length,
                  itemBuilder: (context, index) {
                    return ObatCard(obat: obats[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            )
          : const Text(''),
    );
  }
}
