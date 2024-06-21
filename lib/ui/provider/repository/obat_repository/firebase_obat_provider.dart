import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_obat_repository.dart';

// Provider untuk FirebaseObatRepository
final firebaseObatRepositoryProvider = Provider<FirebaseObatRepository>((ref) {
  return FirebaseObatRepository();
});
