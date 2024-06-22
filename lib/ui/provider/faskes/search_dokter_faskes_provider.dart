import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/firebase_faskes_provider.dart';

final searchDokterFaskesProvider = StateNotifierProvider<SearchDokterFaskesNotifier, AsyncValue<List<Dokter>>>((ref) {
  final faskesRepository = ref.watch(firebaseFaskesRepositoryProvider);
  return SearchDokterFaskesNotifier(faskesRepository: faskesRepository);
});

class SearchDokterFaskesNotifier extends StateNotifier<AsyncValue<List<Dokter>>> {
  final FaskesRepository faskesRepository;

  SearchDokterFaskesNotifier({required this.faskesRepository}) : super(const AsyncValue.loading());

  Future<void> searchDokterFaskesWithKategori(String query, String idKategori) async {
    state = const AsyncValue.loading();
    try {
      final result = await faskesRepository.searchDokterFaskesWithKategori(query, idKategori);
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
