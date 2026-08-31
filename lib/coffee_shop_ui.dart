import 'dart:math';

import 'package:coffee_shop_ui/text.dart';
import 'package:flutter/material.dart';

class CoffeeShopUi extends StatelessWidget {
  const CoffeeShopUi({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF0C0F14),
        padding: EdgeInsets.all(sw * 0.05),
        child: Column(
          children: [
            SizedBox(height: sh * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Container(
                  height: sh * 0.065,
                  width: sw * 0.125,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(sw * 0.04),
                    border: Border.all(color: Color(0xFF424242)),
                  ),
                  child: Image.asset("assets/profile.png", fit: BoxFit.fill),
                ),
              ],
            ),
            SizedBox(height: sh * 0.04),
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
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Data(
                          text: "Cappuccino",
                          color: Color(0xFFD17842),
                          size: sw * 0.047,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: sw*0.02),
                            width: sw * 0.02,
                            height: sh * 0.01,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(sw*0.01),
                            color:  Color(0xFFD17842),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: sh * 0.03),
                    Data(text: "Espresso", size: sw * 0.046),
                    SizedBox(width: sh * 0.03),
                    Data(text: "Latte", size: sw * 0.046),
                    SizedBox(width: sh * 0.03),
                    Data(text: "Flat White", size: sw * 0.046),
                    SizedBox(width: sh * 0.03),
                    Data(text: "French Press", size: sw * 0.046),
                  ],
                ),
              ),
            ),
            SizedBox(height: sh * 0.04),
            Container(
              child:Row(
                children: [
                  Container(
                    height: sh*0.31,
                    width: sw*0.41,
                    decoration: BoxDecoration(
                    color: Color(0xFF1E242E),
                      borderRadius: BorderRadius.circular(sw*0.05)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: sw*0.015),
                            width: sw*0.362,
                            height: sh*0.17,
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sw*0.04),
                              image: DecorationImage(image: AssetImage("assets/coffee1.png"),fit: BoxFit.cover)
                            ),
                            child: Container(
                              padding: EdgeInsets.all(sw*0.01),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft:Radius.circular(sw*0.05)
                                )
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star,color: Color(0xFFD17842),size: sw*0.04,),
                                  Data(text: "4.5",color: Colors.white,size: sw*0.03,)
                                ],
                              ),
                            )
                            ,
                          ),
                          Data(text: "Cappuccino",color: Colors.white54,size: sw*0.05,),
                          Data(text: "Without Milk",color: Colors.white54,size: sw*0.03,),
                          SizedBox(height: sh*0.01,),
                          Row(
                            children: [
                              Icon(Icons.attach_money,color: Color(0xFFD17842),size: sw*0.047,),
                              Data(text: "4.20",color: Colors.white,size: sw*0.047,),
                              SizedBox(width: sw*0.13,),
                              Container(
                                width: sw*0.075,
                                height: sh*0.038,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(sw*0.03),
                                  color: Color(0xFFD17842)
                                ),
                                child: Icon(Icons.add,color: Colors.white,size: sw*0.04,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
