import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'package:super_app_telemedicine/data/repository/obat_repository.dart';
import 'package:super_app_telemedicine/ui/provider/repository/obat_repository/firebase_obat_provider.dart';

final searchObatProvider = StateNotifierProvider<SearchObatNotifier, AsyncValue<List<Obat>>>((ref) {
  final obatRepository = ref.watch(firebaseObatRepositoryProvider);
  return SearchObatNotifier(obatRepository: obatRepository);
});

class SearchObatNotifier extends StateNotifier<AsyncValue<List<Obat>>> {
  final ObatRepository obatRepository;

  SearchObatNotifier({required this.obatRepository}) : super(const AsyncValue.loading());

  Future<void> searchObat(String query) async {
    state = const AsyncValue.loading();
    try {
      final result = await obatRepository.searchObat(query);
      if (result.isSuccess) {
        state = AsyncValue.data(result.resultValue!);
      } else {
        state = AsyncValue.error(result.errorMessage!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e.toString(), stackTrace);
    }
  }

  Future<void> searchObatWithKategori(String query, String idKategori) async {
    state = const AsyncValue.loading();
    try {
      final result = await obatRepository.searchObatWithKategori(query, idKategori);
      if (result.isSuccess) {
        state = AsyncValue.data(result.resultValue!);
      } else {
        state = AsyncValue.error(result.errorMessage!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e.toString(), stackTrace);
    }
  }
}
