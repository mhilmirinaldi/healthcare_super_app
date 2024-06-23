import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/data/firebase/firebase_obat_repository.dart';

final firebaseObatRepositoryProvider = Provider<FirebaseObatRepository>((ref) {
  return FirebaseObatRepository();
});
