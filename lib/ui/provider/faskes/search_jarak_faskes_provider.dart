import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/repository/faskes_repository.dart';
import 'package:super_app_telemedicine/ui/provider/repository/faskes_repository/firebase_faskes_provider.dart';

final searchJarakFaskesProvider = StateNotifierProvider.family<SearchJarakFaskesNotifier, AsyncValue<double>, String>((ref, namaFaskes) {
  final faskesRepository = ref.watch(firebaseFaskesRepositoryProvider);
  return SearchJarakFaskesNotifier(faskesRepository: faskesRepository, namaFaskes: namaFaskes);
});


class SearchJarakFaskesNotifier extends StateNotifier<AsyncValue<double>> {
  final FaskesRepository faskesRepository;
  final String namaFaskes;

  SearchJarakFaskesNotifier({required this.faskesRepository, required this.namaFaskes}) : super(const AsyncValue.loading()) {
    _searchJarakFaskes();
  }

  Future<void> _searchJarakFaskes() async {
    state = const AsyncValue.loading();
    try {
      final result = await faskesRepository.searchJarakByFaskes(namaFaskes: namaFaskes);
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

