

import 'package:coffee_shop_ui/cart_screen/item-class.dart';
import 'package:flutter_riverpod/legacy.dart';

final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>>{
  ItemNotifier() : super([]);

  void add(String imagePath, String itemName, String itemExtra, String itemPrice,String itemQuantity,String iden){

    final alreadyExists = state.any(
          (item) =>
      item.name == itemName &&
          item.extra == itemExtra,
    );

    if (alreadyExists) {
      return;
    }

    final item = Item(
      id: DateTime.now().toString(),
      image_path: imagePath,
      name: itemName,
      extra: itemExtra,
      price: itemPrice,
      quantity: itemQuantity,
      card_iden: iden,
    );

    state.add(item);
    state = state.toList();
  }

  double getTotal() {
    return state.fold(0.0, (total, item) {
      return total + double.parse(item.price);
    });
  }
  void delete(String id){
    state.removeWhere((Item)=>Item.id == id);
    state = state.toList();
  }

  void deleteAll(){
    state.clear();
    state = state.toList();
  }
}