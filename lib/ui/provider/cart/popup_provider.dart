import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupState {
  final bool isVisible;

  PopupState(this.isVisible);
}

class PopupNotifier extends StateNotifier<PopupState> {
  PopupNotifier() : super(PopupState(false));

  void show() {
    state = PopupState(true);
  }

  void hide() {
    state = PopupState(false);
  }
}

final popupProvider = StateNotifierProvider<PopupNotifier, PopupState>((ref) {
  return PopupNotifier();
});
