import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_faskes_repository.dart';

final firebaseFaskesRepositoryProvider = Provider<FirebaseFaskesRepository>((ref) {
  return FirebaseFaskesRepository();
});
