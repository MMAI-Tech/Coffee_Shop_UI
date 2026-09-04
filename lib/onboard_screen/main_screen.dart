import 'package:coffee_shop_ui/home_page/coffee_shop.dart';
import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF0C0F14),
          ),
          Column(
            children: [
              Container(
                height: sh * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/onboard.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0C0F14).withValues(alpha: 0.55),
                  ),
                ),
              ),
              Container(
                height: sh*0.4,
                width: double.infinity,
                padding: EdgeInsets.only(left:sw*0.055),
                decoration: BoxDecoration(
                  color: Color(0xFF0C0F14).withValues(alpha: 0.4),
             
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF0C0F14).withValues(alpha: 0.9),
                      offset: const Offset(0, -8),
                      blurRadius: 30,
                      spreadRadius: 35,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: sw*0.03,),
                    Data(text: "Good Coffee",color: Colors.white,size: sw*0.1,),
                    SizedBox(height: sw*0.01,),
                    Data(text: "Great Day",color: Colors.deepOrangeAccent,size: sw*0.1,),
                    SizedBox(height: sw*0.040,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: sw*0.1,
                          height: sh*0.003,
                          color: Colors.deepOrangeAccent,
                        ) ,
                        SizedBox(width: sw*0.03,),
                        Container(
                          width: sw*0.07,
                          height: sh*0.035,
                          child: Icon(Icons.coffee,color: Colors.deepOrangeAccent,size: sw*0.06,),
                        ),
                        Container(
                          width: sw*0.10,
                          height: sh*0.003,
                          color: Colors.deepOrangeAccent,
                        ) ,
                      ],
                    ),
                    SizedBox(height: sw*0.040,),
                    Data(text: "Find the best coffee\nfor your perfect moment",color: Colors.white,size: sw*0.047,),
                    SizedBox(height: sw*0.10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoffeeShopUi()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: sw*0.055,right: sw*0.055),
                        height:sh*0.09 ,
                        width: sw*0.9,
                        decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(sw*0.045)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Data(text: "Get Started",color: Colors.white,size: sw*0.055,),
                            Icon(Icons.arrow_forward,color: Colors.white,size: sw*0.08,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
