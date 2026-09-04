import 'package:coffee_shop_ui/coffee_card/item_card.dart';
import 'package:coffee_shop_ui/home_page/coffee_shop.dart';
import 'package:coffee_shop_ui/onboard_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnboardScreen(),
      ),
    );
  }
}
