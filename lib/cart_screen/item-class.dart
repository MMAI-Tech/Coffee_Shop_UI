import 'dart:ui';

class Item{
  String id;
  String image_path;
  String name;
  String extra;
  String price;
  String quantity;
  String card_iden;

  Item({
    required this.id,
    required this.image_path,
    required this.name,
    required this.extra,
    required this.price,
    required this.quantity,
    required this.card_iden,
  });
}