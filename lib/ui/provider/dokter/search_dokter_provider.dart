import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/dokter.dart';
import 'package:super_app_telemedicine/data/repository/dokter_repository.dart';
import 'package:super_app_telemedicine/ui/provider/repository/dokter_repository/firebase_dokter_provider.dart';

final searchDokterProvider = StateNotifierProvider<SearchDokterNotifier, AsyncValue<List<Dokter>>>((ref) {
  final dokterRepository = ref.watch(firebaseDokterRepositoryProvider);
  return SearchDokterNotifier(dokterRepository: dokterRepository);
});

class SearchDokterNotifier extends StateNotifier<AsyncValue<List<Dokter>>> {
  final DokterRepository dokterRepository;

  SearchDokterNotifier({required this.dokterRepository}) : super(const AsyncValue.loading());

  Future<void> searchDokter(String query) async {
    state = const AsyncValue.loading();
    try {
      final result = await dokterRepository.searchDokter(query);
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
