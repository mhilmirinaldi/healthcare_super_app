import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = StateNotifierProvider<DurationController, int>((ref) => DurationController());

class DurationController extends StateNotifier<int> {
  DurationController() : super(60 * 10); // Default duration in seconds

  void extendDuration(int additionalSeconds) {
    state += additionalSeconds;
  }

  void resetDuration() {
    state = 60 * 10; // Reset to default duration
  }

  void setDuration(int seconds) {
    state = seconds;
  }
  
}