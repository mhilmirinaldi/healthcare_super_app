import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_dokter_repository.dart';

final firebaseDokterRepositoryProvider = Provider<FirebaseDokterRepository>((ref) {
  return FirebaseDokterRepository();
});
