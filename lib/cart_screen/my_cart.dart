import 'package:coffee_shop_ui/cart_screen/cart_item.dart';
import 'package:coffee_shop_ui/cart_screen/item_riverpod.dart';
import 'package:coffee_shop_ui/home_page/coffee_shop.dart';
import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_page/coffee_name_riverpod.dart';
import '../home_page/nav_icon.dart';

class MyCart extends ConsumerStatefulWidget {
  const MyCart({super.key});

  @override
  ConsumerState<MyCart> createState() => _MyCardState();
}

class _MyCardState extends ConsumerState<MyCart> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFF0C0F14),
      body:Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(sw*0.04),
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: sh*0.05,
                    ),
                    // page head
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Data(text: "My Cart",color: Colors.white,size: sw*0.07,),
                            SizedBox(height: sh*0.02,),
                            Data(text: "Review your items",color: Colors.grey,size: sw*0.04,)
                          ],

                        ),
                        GestureDetector(
                            onTap: (){
                              ref.read(itemProvider.notifier).deleteAll();
                            },
                            child: Icon(Icons.delete_forever_outlined,color:Colors.white,size: sw*0.1,))
                      ],
                    ),
                 SizedBox(height: sh*0.022,),
                    // cart items
                    Container(
                      width: double.infinity,
                      height: sw*0.8,

                      child: Consumer(builder: (context,ref,child){
                        final item = ref.watch(itemProvider);
                        return item.isEmpty ?
                            Center(
                              child: Column(
                                children: [
                                  Image.asset("assets/images/cart.png",width: sw*0.6,),
                                  Data(text: "Your Cart is Empty", size: sw*0.07,color: Colors.grey,),
                                ],
                              ),
                            ): ListView.builder(
                            padding: EdgeInsets.zero,
                          itemCount: item.length,
                            itemBuilder: (context,index){
                            var current_item = item[index];
                            return CartItem(
                              image_path: current_item.image_path,
                              name: current_item.name,
                              extra: current_item.extra,
                              price: current_item.price,
                             quantity: current_item.quantity,
                            delete_ontap: (){
                                ref.read(itemProvider.notifier).delete(current_item.id);
                            },);
                        });
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: sh*0.35,
            padding: EdgeInsets.all(sw*0.05),
            decoration: BoxDecoration(
            color:  Color(0xFF1E242E).withValues(alpha: 0.4),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(sw*0.06),
                topLeft: Radius.circular(sw*0.06),
              )
            ),
            child: Column(
              children: [
                SizedBox(height: sw*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Data(text: "Subtotal",color: Colors.grey[300],size: sw*0.04,),
                    Data(text: "\$"+"12.90",color: Colors.grey[300],size: sw*0.04,)
                  ],
                ),
                SizedBox(height: sw*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Data(text: "Delivery Fee",color: Colors.grey[300],size: sw*0.04,),
                    Data(text: "\$"+"2.00",color: Colors.grey[300],size: sw*0.04,)
                  ],
                ),
                SizedBox(height: sw*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Data(text: "Tax (5%)",color: Colors.grey[300],size: sw*0.04,),
                    Data(text: "\$"+"0.05",color: Colors.grey[300],size: sw*0.04,)
                  ],
                ),
                SizedBox(height: sw*0.04,),
                Container(
                  height: sh*0.002,
                  width: double.infinity,
                  color:Colors.grey[700],
                ),
                SizedBox(height: sw*0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Data(text: "Total",color: Colors.grey[300],size: sw*0.05,),
                    Data(text: "\$"+"15.55",color: Colors.deepOrangeAccent,size: sw*0.05,)
                  ],
                ),
                SizedBox(height: sw*0.1,),

                Container(
                  width: double.infinity,
                  height: sh*0.07,
                  padding: EdgeInsets.all(sw*0.03),
                  decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(sw*0.02),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Data(text: "Proceed to Checkout",color: Colors.white,size: sw*0.04,),
                      Row(
                        children: [
                          Data(text: "\$"+"15.55",color: Colors.white,size: sw*0.04,),
                          SizedBox(width: sw*0.02,),
                          Icon(Icons.arrow_forward,color: Colors.white,size: sw*0.055,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeShopUi()));
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
