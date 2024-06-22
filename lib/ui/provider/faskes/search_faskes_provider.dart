import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/faskes.dart';
import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/firebase_faskes_provider.dart';

final searchFaskesProvider = StateNotifierProvider<SearchFaskesNotifier, AsyncValue<List<Faskes>>>((ref) {
  final faskesRepository = ref.watch(firebaseFaskesRepositoryProvider);
  return SearchFaskesNotifier(faskesRepository: faskesRepository);
});

class SearchFaskesNotifier extends StateNotifier<AsyncValue<List<Faskes>>> {
  final FaskesRepository faskesRepository;

  SearchFaskesNotifier({required this.faskesRepository}) : super(const AsyncValue.loading());

  Future<void> searchFaskes(String query) async {
    state = const AsyncValue.loading();
    try {
      final result = await faskesRepository.searchFaskes(query);
      if (result.isSuccess) {
        state = AsyncValue.data(result.resultValue!);
      } else {
        state = AsyncValue.error(result.errorMessage!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e.toString(), stackTrace);
    }
  }

  Future<void> searchFaskesWithKategori(String query, String idKategori) async {
    state = const AsyncValue.loading();
    try {
      final result = await faskesRepository.searchFaskesWithKategori(query, idKategori);
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
