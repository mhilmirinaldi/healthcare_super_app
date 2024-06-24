import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/domain/entity/obat.dart';
import 'popup_provider.dart';

class CartProvider extends ChangeNotifier {
  final Ref _ref;
  final List<Obat> _items = [];

  CartProvider(this._ref);

  List<Obat> get items => _items;

  int get totalItems => _items.fold(0, (total, item) => total + item.jumlah!);

  void addItem(Obat obat) {
    final index = _items.indexWhere((item) => item.id == obat.id);
    if (index != -1) {
      _items[index] =
          _items[index].copyWith(jumlah: (_items[index].jumlah ?? 0) + 1);
    } else {
      _items.add(obat.copyWith(jumlah: 1));
    }
    _ref.read(popupProvider.notifier).show();
    notifyListeners();
  }

  void removeItem(String obatId) {
    final index = _items.indexWhere((item) => item.id == obatId);
    if (index != -1) {
      if (_items[index].jumlah! > 1) {
        _items[index] =
            _items[index].copyWith(jumlah: _items[index].jumlah! - 1);
      } else {
        _items.removeAt(index);
      }
      if (_items.isEmpty) {
        _ref.read(popupProvider.notifier).hide();
      }
      notifyListeners();
    }
  }

  void removeAllItem(){
    _items.clear();
    _ref.read(popupProvider.notifier).hide();
    notifyListeners();
  }

  int getItemCount(String obatId) {
    final index = _items.indexWhere((item) => item.id == obatId);
    if (index != -1) {
      return _items[index].jumlah ?? 0;
    }
    return 0;
  }
}

final cartProvider = ChangeNotifierProvider<CartProvider>((ref) {
  return CartProvider(ref);
});
