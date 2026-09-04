

import 'package:coffee_shop_ui/cart_screen/my_cart.dart';
import 'package:coffee_shop_ui/coffee_card/coffee_card_riverpod.dart';
import 'package:coffee_shop_ui/coffee_card/item_card.dart';
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
                      color: Colors.grey[700],
                      size: sw * 0.06,
                    ),
                  ),
                  // Profile  Container
                  Container(
                    height: sh * 0.065,
                    width: sw * 0.131,
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
                  style: TextStyle(color: Colors.white)
                  ,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: sw*0.02),
                    filled: true,
                    fillColor: Color(0xFF141921),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[700],size: sw*0.065,),
                    hintText: "Find Your Coffee...",
                    hintStyle: TextStyle(color: Colors.grey[700],fontSize: sw*0.05),
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
                          }, name: "Cappuccino",color: val == 0?Colors.orange:Colors.grey[700],toggle: val == 0?true:false,),
                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 1;
                          },name: "Espresso",color: val == 1?Colors.orange:Colors.grey[700],toggle: val == 1?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 2;
                          },name: "Latte",color: val == 2?Colors.orange:Colors.grey[700],toggle: val == 2?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 3;
                          },name: "Flat White",color: val == 3?Colors.orange:Colors.grey[700],toggle: val == 3?true:false,),

                          SizedBox(width: sh * 0.03),
                          ItemName(ontap: (){
                            ref.read(coffee_num.notifier).state = 4;
                          },name: "French Press",color: val == 4?Colors.orange:Colors.grey[700],toggle: val == 4?true:false,),

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
                          CoffeeCard(
                            ontap: (){
                              ref.read(total_price("coffee1").notifier).state = 4.20;
                              ref.read(isAdd("Extras").notifier).state = false;
                              ref.read(isAdd("fav").notifier).state = false;
                              ref.read(isAdd("Syrup").notifier).state = false;
                              ref.read(counter("coffee3").notifier).state = 1;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                data_name: "coffee1",
                                path:"assets/images/coffee1.png",
                                name:"Cappuccino" ,
                                type:'Without Milk',
                                description: "A bold, rich espresso base crafted coffee purists. Enjoy coffee flavor without added milk.",
                                rate: "4.5",
                                small: 3.50,
                                medium: 4.20,
                                large: 4.80,
                              )));
                            },
                            image_path: "assets/images/coffee1.png",
                            name: "Cappuccino",
                            rating: "4.5",
                            type: "Without Milk",
                            price: "4.20",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(
                            ontap: (){
                              ref.read(total_price("coffee2").notifier).state = 4.25;
                              ref.read(isAdd("Extras").notifier).state = false;
                              ref.read(isAdd("Syrup").notifier).state = false;
                              ref.read(isAdd("fav").notifier).state = false;
                              ref.read(counter("coffee3").notifier).state = 1;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                data_name: "coffee2",
                                path:"assets/images/coffe2.png",
                                name:"Cappuccino" ,
                                type:'With Chocolate',
                                description: "A bold espresso crafted for coffee purists, delivering pure flavor without added milk.",
                                rate: "4.2",
                                small: 3.14,
                                medium: 4.25,
                                large: 5.10,
                              )));
                            },
                            image_path: "assets/images/coffe2.png",
                            name: "Cappuccino",
                            rating: "4.2",
                            type: "With Chocolate",
                            price: "4.25",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(
                            ontap: (){
                              ref.read(total_price("coffee3").notifier).state = 5.00;
                              ref.read(isAdd("Extras").notifier).state = false;
                              ref.read(isAdd("Syrup").notifier).state = false;
                              ref.read(isAdd("fav").notifier).state = false;
                              ref.read(counter("coffee3").notifier).state = 1;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                data_name: "coffee3",
                                path:"assets/images/coffee3.png",
                                name:"Cappuccino" ,
                                type:'With Italian',
                                description: "An authentic Italian-style espresso paired with velvety steamed milk and rich foam.",
                                rate: "4.0",
                                small: 3.80,
                                medium: 5.00,
                                large: 6.20,
                              )));
                            },
                            image_path: "assets/images/coffee3.png",
                            name: "Cappuccino",
                            rating: "4.0",
                            type: "With Italian",
                            price: "5.00",),
                          SizedBox(width: sw * 0.06,),
                          CoffeeCard(
                            ontap: (){
                              ref.read(total_price("coffee4").notifier).state = 5.30;
                              ref.read(isAdd("Extras").notifier).state = false;
                              ref.read(isAdd("Syrup").notifier).state = false;
                              ref.read(isAdd("fav").notifier).state = false;
                              ref.read(counter("coffee4").notifier).state = 1;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                data_name: "coffee4",
                                path:"assets/images/coffee5.png",
                                name:"Cappuccino" ,
                                type:'Creamy Bliss',
                                description: "A rich espresso layered with thick creamy foam and drizzled with chocolate.",
                                rate: "4.3",
                                small: 3.90,
                                medium: 5.30,
                                large: 6.50,
                              )));
                            },
                            image_path: "assets/images/coffee5.png",
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
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee5").notifier).state = 4.40;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee5").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee5",
                                  path:"assets/images/coffee8.png",
                                  name:"Espresso" ,
                                  type:"With Oat",
                                  description: "A strong shot of espresso shaken over ice and topped with creamy oat milk for a smooth.",
                                  rate: "3.9",
                                  small: 3.50,
                                  medium: 4.40,
                                  large: 5.20,
                                )));
                              },
                              image_path: "assets/images/coffee8.png",
                              name: "Espresso",
                              rating: "3.9",
                              type: "With Oat",
                              price: "4.40",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee6").notifier).state = 4.10;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee6").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee6",
                                  path:"assets/images/coffee9.png",
                                  name:"Midnight Shot",
                                  type:"No Milk",
                                  description: "A powerful double shot of pure espresso served steaming hot. Intense for a true caffeine kick.",
                                  rate:  "4.0",
                                  small: 3.20,
                                  medium: 4.10,
                                  large: 4.80,
                                )));
                              },
                              image_path: "assets/images/coffee9.png",
                              name: "Midnight Shot",
                              rating: "4.0",
                              type: "No Milk",
                              price: "4.10",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee7").notifier).state = 3.70;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee7").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee7",
                                  path:"assets/images/coffee10.png",
                                  name:"Classic",
                                  type:"Extra Milk",
                                  description: "Smooth espresso blended with extra silky steamed milk and topped with latte art.",
                                  rate:  "4.5",
                                  small: 2.80,
                                  medium: 3.70,
                                  large: 4.50,
                                )));
                              },
                              image_path: "assets/images/coffee10.png",
                              name: "Classic",
                              rating: "4.5",
                              type: "Extra Milk",
                              price: "3.70",),

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
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee8").notifier).state = 5.60;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee8").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee8",
                                  path:"assets/images/coffee11.png",
                                  name:"Matcha Latte",
                                  type:"Almond Milk",
                                  description: "Premium Japanese green tea matcha whisked with silky almond milk for a smooth.",
                                  rate:  "4.7",
                                  small: 4.50,
                                  medium: 5.60,
                                  large: 6.40,
                                )));
                              },
                              image_path: "assets/images/coffee11.png",
                              name: "Matcha Latte",
                              rating: "4.7",
                              type: "Almond Milk",
                              price: "5.60",),
                            SizedBox(width: sw * 0.06,),
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee9").notifier).state = 5.20;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee9").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee9",
                                  path:"assets/images/coffee12.png",
                                  name:"Hazelnut Latte",
                                  type:"Extra Hazelnut Syrup",
                                  description: "A smooth espresso shot poured over velvety steamed coconut milk.",
                                  rate:  "4.5",
                                  small: 4.20,
                                  medium: 5.80,
                                  large: 6.10,
                                )));
                              },
                              image_path: "assets/images/coffee12.png",
                              name: "Hazelnut Latte",
                              rating: "4.5",
                              type: "Extra Hazelnut Syrup",
                              price: "5.20",),

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
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee10").notifier).state = 5.80;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee10").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee10",
                                  path:"assets/images/coffee13.png",
                                  name:"Coconut Flat",
                                  type:"Coconut Milk",
                                  description: "Smooth espresso blended with extra silky steamed milk and topped with latte art.",
                                  rate:  "4.5",
                                  small: 4.90,
                                  medium: 5.80,
                                  large: 6.70,
                                )));
                              },
                              image_path: "assets/images/coffee13.png",
                              name: "Coconut Flat",
                              rating: "4.5",
                              type: "Coconut Milk",
                              price: "5.20",),
                            SizedBox(width: sw * 0.08,),
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee11").notifier).state = 5.40;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee11").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee11",
                                  path:"assets/images/coffee14.png",
                                  name:"Honey Almond",
                                  type:"Almond Milk",
                                  description: "Smooth blonde espresso combined with creamy almond milk and sweetened.",
                                  rate:  "4.6",
                                  small: 4.30,
                                  medium: 5.40,
                                  large: 6.30,
                                )));
                              },
                              image_path: "assets/images/coffee14.png",
                              name: "Honey Almond",
                              rating: "4.6",
                              type: "Almond Milk",
                              price: "5.40",),
                            SizedBox(width: sw * 0.08,),
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee12").notifier).state = 4.85;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee12").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee12",
                                  path:"assets/images/coffee15.png",
                                  name:"Iced Flat",
                                  type:"Whole Milk",
                                  description: "Chilled espresso mixed with cold whole milk and poured over ice for a crisp.",
                                  rate:  "4.7",
                                  small: 3.90,
                                  medium: 4.85,
                                  large: 5.75,
                                )));
                              },
                              image_path: "assets/images/coffee15.png",
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
                            CoffeeCard(
                              ontap: (){
                                ref.read(total_price("coffee13").notifier).state = 5.10;
                                ref.read(isAdd("Extras").notifier).state = false;
                                ref.read(isAdd("Syrup").notifier).state = false;
                                ref.read(isAdd("fav").notifier).state = false;
                                ref.read(counter("coffee13").notifier).state = 1;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                                  data_name: "coffee13",
                                  path:"assets/images/coffee16.png",
                                  name: "Vanilla Spiced",
                                  type:"Extra Vanilla Bean",
                                  description: "Warm espresso combined with steamed milk, infused with aromatic vanilla bean and finished.",
                                  rate:  "4.6",
                                  small: 4.10,
                                  medium: 5.10,
                                  large: 6.00,
                                )));
                              },
                              image_path: "assets/images/coffee16.png",
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
              Consumer(builder: (context,ref,child){
                return  Column(
                    children: [
                      SpecialCoffeeCard(
                        ontap: (){
                          ref.read(total_price("coffee14").notifier).state = 9.50;
                          ref.read(isAdd("Extras").notifier).state = false;
                          ref.read(isAdd("Syrup").notifier).state = false;
                          ref.read(isAdd("fav").notifier).state = false;
                          ref.read(counter("coffee14").notifier).state = 1;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                            data_name: "coffee14",
                            path:"assets/images/coffee4.png",
                            name: "5 Coffee Bean",
                            type:"Premium Arabica Beans",
                            description: "Hand-picked premium single-origin Arabica coffee beans roasted to perfection.",
                            rate:  "4.8",
                            small: 5.30,
                            medium: 9.50,
                            large: 16.00,
                          )));
                        },
                        image_path: 'assets/images/coffee4.png', name: '5 Coffee Beans\nYou Mush Try!',type: 'Premium Arabica Beans',price: '9.50',),
                      SizedBox(height: sh*0.02,),
                      SpecialCoffeeCard(
                        ontap: (){
                          ref.read(total_price("coffee15").notifier).state = 5.10;
                          ref.read(isAdd("Extras").notifier).state = false;
                          ref.read(isAdd("Syrup").notifier).state = false;
                          ref.read(isAdd("fav").notifier).state = false;
                          ref.read(counter("coffee15").notifier).state = 1;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                            data_name: "coffee15",
                            path:"assets/images/coffee6.png",
                            name: "Macchiato",
                            type:"Smooth coffee, caramel",
                            description: "Rich espresso layered over fresh chilled milk and vanilla syrup, finished with caramel.",
                            rate:  "4.7",
                            small: 4.20,
                            medium: 5.10,
                            large: 6.10,
                          )));
                        },
                        image_path: 'assets/images/coffee6.png', name: 'Iced Caramel\nMacchiato!',type: 'Smooth coffee, caramel',price: '5.10',),
                      SizedBox(height: sh*0.02,),
                      SpecialCoffeeCard(
                        ontap: (){
                          ref.read(total_price("coffee16").notifier).state = 4.67;
                          ref.read(isAdd("Extras").notifier).state = false;
                          ref.read(isAdd("Syrup").notifier).state = false;
                          ref.read(isAdd("fav").notifier).state = false;
                          ref.read(counter("coffee16").notifier).state = 1;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeCardInfo(
                            data_name: "coffee16",
                            path:"assets/images/coffee7.png",
                            name: "Cappuccino",
                            type:"Rich and creamy",
                            description: "Velvety smooth espresso crafted with steamed extra creamy milk, topped with intricate.",
                            rate:  "4.7",
                            small: 3.80,
                            medium: 4.67,
                            large: 5.50,
                          )));
                        },
                        image_path: 'assets/images/coffee7.png', name: 'Velvet Cappuccino\nWith Extra Milk!',type: 'Rich and creamy ',price: '4.67',),
                    ] );
              }),

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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyCart()));
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
