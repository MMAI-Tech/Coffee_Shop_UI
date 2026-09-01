

import 'package:coffee_shop_ui/home_page/coffee_card.dart';
import 'package:coffee_shop_ui/home_page/coffee_name_riverpod.dart';
import 'package:coffee_shop_ui/home_page/item_name.dart';
import 'package:coffee_shop_ui/home_page/nav_icon.dart';
import 'package:coffee_shop_ui/home_page/special_coffee_card.dart';
import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeShopUi extends StatelessWidget {
  const CoffeeShopUi({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body:
      //     Main full Screen formatting,
      Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF0C0F14),
        padding: EdgeInsets.all(sw * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: sh * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Drawer Icon
                  Container(
                    height: sh * 0.065,
                    width: sw * 0.125,
                    decoration: BoxDecoration(
                      color: Color(0xFF141921),
                      borderRadius: BorderRadius.circular(sw * 0.04),
                    ),
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: Colors.grey[800],
                      size: sw * 0.06,
                    ),
                  ),
                  // Profile  Container
                  Container(
                    height: sh * 0.065,
                    width: sw * 0.125,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(sw * 0.04),
                      border: Border.all(color: Color(0xFF424242)),
                    ),
                    child: Image.asset("assets/images/profile.png", fit: BoxFit.fill),
                  ),
                ],
              ),
              SizedBox(height: sh * 0.04),
              // Main Screen Text
              Container(
                padding: EdgeInsets.only(left: sw * 0.03),
                alignment: Alignment.topLeft,
                child: Text(
                  'Find the best \ncoffee for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: sh * 0.04),
              // Search bar
              Container(
                width: sw * 0.9,
                height: sh * 0.056,
          
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF141921),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[800]),
                    hint: Text(
                      'Find Your Cofee',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(sw * 0.04),
                      borderSide: BorderSide(color: Color(0xFF141921)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(sw * 0.04),
                      borderSide: BorderSide(color: Color(0xFF141921)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(sw * 0.04),
                      borderSide: BorderSide(color: Color(0xFF141921)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: sh * 0.04),
              // Coffee's name Row
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Consumer(builder: (context,ref,child){
                    num val = ref.watch(coffee_num);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 0;
                          }, name: "Cappuccino",color: val == 0?Colors.orange:Colors.grey[800],toggle: val == 0?true:false,),
                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 1;
                          },name: "Espresso",color: val == 1?Colors.orange:Colors.grey[800],toggle: val == 1?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 2;
                          },name: "Latte",color: val == 2?Colors.orange:Colors.grey[800],toggle: val == 2?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 3;
                          },name: "Flat White",color: val == 3?Colors.orange:Colors.grey[800],toggle: val == 3?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 4;
                          },name: "French Press",color: val == 4?Colors.orange:Colors.grey[800],toggle: val == 4?true:false,),

                        ],
                      );
                  })


                ),
              ),
              SizedBox(height: sh * 0.04),
              // Cards
              Consumer(builder: (context,ref,child){
                num val = ref.watch(coffee_num);
                if(val == 0) {
                  return
                    Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CoffeeCard(image_path: "assets/images/coffee1.png",
                            name: "Cappuccino",
                            rating: "4.5",
                            type: "Without Milk",
                            price: "4.20",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(image_path: "assets/images/coffe2.png",
                            name: "Cappuccino",
                            rating: "4.2",
                            type: "With Chocolate",
                            price: "3.14",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(image_path: "assets/images/coffee3.png",
                            name: "Cappuccino",
                            rating: "4.0",
                            type: "With Italian",
                            price: "5.00",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(image_path: "assets/images/coffee5.png",
                            name: "Cappuccino",
                            rating: "4.3",
                            type: "Creamy Bliss",
                            price: "5.30",),
                        ],
                      ),
                    ),
                  );
                }
                else if(val == 1){
                  return
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CoffeeCard(image_path: "assets/images/coffee8.png",
                              name: "Espresso",
                              rating: "3.9",
                              type: "With Oat",
                              price: "3.50",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(image_path: "assets/images/coffee9.png",
                              name: "Midnight Shot",
                              rating: "4.0",
                              type: "No Milk",
                              price: "3.20",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(image_path: "assets/images/coffee10.png",
                              name: "Classic",
                              rating: "4.5",
                              type: "Extra Milk",
                              price: "2.80",),

                          ],
                        ),
                      ),
                    );
                } else if(val == 2){
                  return
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CoffeeCard(image_path: "assets/images/coffee11.png",
                              name: "Matcha Latte",
                              rating: "4.7",
                              type: "Almond Milk",
                              price: "4.50",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(image_path: "assets/images/coffee12.png",
                              name: "Hazelnut Latte",
                              rating: "4.5",
                              type: "Extra Hazelnut Syrup",
                              price: "4.90",),

                          ],
                        ),
                      ),
                    );
                }else if(val == 3){
                  return
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CoffeeCard(image_path: "assets/images/coffee13.png",
                              name: "Coconut Flat",
                              rating: "4.5",
                              type: "Coconut Milk",
                              price: "5.20",),
                            SizedBox(width: sw * 0.08,),
                            CoffeeCard(image_path: "assets/images/coffee14.png",
                              name: "Honey Almond",
                              rating: "4.6",
                              type: "Almond Milk",
                              price: "5.40",),
                            SizedBox(width: sw * 0.08,),
                            CoffeeCard(image_path: "assets/images/coffee15.png",
                              name: "Iced Flat",
                              rating: "4.7",
                              type: "Whole Milk",
                              price: "4.85",),

                          ],
                        ),
                      ),
                    );
                }
                else{
                  return
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CoffeeCard(image_path: "assets/images/coffee16.png",
                              name: "Vanilla Spiced",
                              rating: "4.6",
                              type: "Extra Vanilla Bean",
                              price: "5.10",),
                          ],
                        ),
                      ),
                    );
                }


              }),


              // Special for you Section
              SizedBox(height: sh*0.05,),
              Container(
                width: double.infinity,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Data(text: "Special for you",color: Colors.white,size: sw*0.05,),
                    Data(text: "Show all",color: Colors.deepOrange)
                  ],
                ),
              ),
              // Spacial  Cards
              SizedBox(height: sh*0.02,),
              SpecialCoffeeCard(image_path: 'assets/images/coffee4.png', name: '5 Coffee Beans\nYou Mush Try!',type: 'Premium Arabica Beans',price: '5.30',),
              SizedBox(height: sh*0.04,),
              SpecialCoffeeCard(image_path: 'assets/images/coffee6.png', name: 'Iced Caramel\nMacchiato!',type: 'Smooth coffee, caramel',price: '5.10',),
              SizedBox(height: sh*0.04,),
              SpecialCoffeeCard(image_path: 'assets/images/coffee7.png', name: 'Velvet Cappuccino\nWith Extra Milk!',type: 'Rich and creamy ',price: '4.67',),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Consumer(builder: (context,ref,child){
            num val = ref.watch(nav_num);
            return BottomAppBar(
                height: sh*0.07,
                color:Color(0xFF0C0F14) ,
                padding:EdgeInsets.zero ,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavIcon(onTap: (){
                      ref.read(nav_num.notifier).state = 0;
                    },
                      icon: Icons.home,color:val == 0? Colors.orange:Colors.grey[800],),
                    NavIcon(onTap: (){
                      ref.read(nav_num.notifier).state = 1;
                    },
                      icon: Icons.shopping_cart,color:val == 1? Colors.orange:Colors.grey[800],),
                    NavIcon(onTap: (){
                      ref.read(nav_num.notifier).state = 2;
                    },
                      icon: Icons.favorite,color:val == 2? Colors.orange:Colors.grey[800],),
                    NavIcon(onTap: (){
                      ref.read(nav_num.notifier).state = 3;
                    },
                        icon: Icons.notifications,color:val == 3? Colors.orange:Colors.grey[800],)
                  ],

                )
            );
          })

    );
  }
}
