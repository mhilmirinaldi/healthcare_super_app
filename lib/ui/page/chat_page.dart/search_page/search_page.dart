import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/page/chat_page.dart/dokter_card.dart';
import 'package:super_app_telemedicine/ui/provider/dokter/search_dokter_provider.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  final FocusNode _searchFocusNode = FocusNode();

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
                bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
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
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: TextField(
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
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _search(_searchController.text);
                  },
                ),
              ),
            ],
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
        child: _hasSearched ? searchResults.when(
          data: (dokters) {
            if (dokters.isEmpty) {
              return const Center(child: Text('Tidak ada hasil ditemukan'));
            }
            return ListView.builder(
              itemCount: dokters.length,
              itemBuilder: (context, index) {
                return DokterCard(dokter: dokters[index]);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ) : const Text(''),
      ),
    );
  }
}
