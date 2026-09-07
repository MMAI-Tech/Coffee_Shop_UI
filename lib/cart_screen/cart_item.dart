import 'dart:ffi';

import 'package:flutter/material.dart';

import '../home_page/text.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.image_path,
    required this.name,
    this.extra,
    required this.price,
    this.delete_ontap
  });

  final String image_path;
  final String name;
  final String? extra;
  final String price;
  final VoidCallback? delete_ontap;
  @override
  State<CartItem> createState() => _CartItemState();
}


class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
  double sw = MediaQuery.of(context).size.width;
  double sh = MediaQuery.of(context).size.height;
    return  Container(
      width: double.infinity,
      height: sw*0.35,
      padding: EdgeInsets.all(sw*0.03),
      margin: EdgeInsets.only(bottom: sw*0.03),
      decoration: BoxDecoration(
          color:  Color(0xFF1E242E).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(sw*0.04)
      ),
      child: Center(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(sw*0.03),
              child: Container(
                width: sw*0.24,
                height: double.infinity,
                child: Image.asset(widget.image_path,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: sw*0.04),
            Expanded(
              child: Container(
                height: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Data(text: widget.name,color: Colors.white,size: sw*0.05,),
                        GestureDetector(
                            onTap: widget.delete_ontap,
                            child: Icon(Icons.delete_forever_outlined,color: Colors.deepOrange,size: sw*0.07,))
                      ],
                    ),
                    SizedBox(height: sh*0.012,),
                    Row(
                      children: [
                        Data(text:widget.extra??" " ,color: Colors.grey,size: sw*0.04,),
                        SizedBox(width: sw*0.04,),
                        Container(
                          height: sh*0.035,
                          width: sw*0.18,
                          decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(sw*0.05),
                              border: Border.all(color: Colors.green)

                          ),
                          child: Center(
                            child: Data(text: "Small",color: Colors.green,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: sh*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Data(text: "\$"+widget.price,color: Colors.deepOrangeAccent,size: sw*0.047,),
                        Container(
                          height: sh*0.03,
                          width: sw * 0.4,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  width: sw * 0.07,
                                  height: sh * 0.05,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF424242).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(sw * 0.1),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: sw * 0.05,
                                  ),
                                ),
                              ),
                              SizedBox(width: sw*0.05,),
                              Data(
                                text: "1",
                                color: Colors.white,
                                size: sw * 0.05,
                              ),
                              SizedBox(width: sw*0.05,),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  width: sw * 0.07,
                                  height: sh * 0.05,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF424242).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(sw * 0.1),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.deepOrange,
                                    size: sw * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
