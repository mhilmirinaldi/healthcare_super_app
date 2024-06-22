import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_faskes_repository.dart';

// Provider untuk FirebaseFaskesRepository
final firebaseFaskesRepositoryProvider = Provider<FirebaseFaskesRepository>((ref) {
  return FirebaseFaskesRepository();
});
