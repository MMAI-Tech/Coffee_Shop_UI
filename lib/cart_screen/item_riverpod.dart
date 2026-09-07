

import 'package:coffee_shop_ui/cart_screen/item-class.dart';
import 'package:flutter_riverpod/legacy.dart';

final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>>{
  ItemNotifier() : super([]);

  void add(String imagePath, String itemName, String itemExtra, String itemPrice){

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
    );

    state.add(item);
    state = state.toList();
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