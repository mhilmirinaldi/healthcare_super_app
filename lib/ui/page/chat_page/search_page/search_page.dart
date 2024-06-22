import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                hintText: 'Cari dokter atau spesialis',
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
            )
          : const Text(''),
    );
  }
}
