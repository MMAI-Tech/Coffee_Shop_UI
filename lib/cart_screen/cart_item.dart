
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../coffee_card/coffee_card_riverpod.dart';
import '../home_page/text.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem({
    super.key,
    required this.image_path,
    required this.name,
    this.extra,
    required this.price,
    this.delete_ontap,
    this.quantity,
    required this.data_name
  });

  final String image_path;
  final String name;
  final String? extra;
  final String price;
  final VoidCallback? delete_ontap;
  final String? quantity;
  final String data_name;
  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}


class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
  double sw = MediaQuery.of(context).size.width;
  double sh = MediaQuery.of(context).size.height;
    Widget size(int val){
      if(val == 1){
        return
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
        );
      }
      else if(val == 3){
        return
        Container(
          height: sh*0.035,
          width: sw*0.18,
          decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(sw*0.05),
              border: Border.all(color: Colors.red)

          ),
          child: Center(
            child: Data(text: "Large",color: Colors.red,),
          ),
        );
      }
      else {
        return
        Container(
          height: sh*0.035,
          width: sw*0.18,
          decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(sw*0.05),
              border: Border.all(color: Colors.orange)

          ),
          child: Center(
            child: Data(text: "Medium",color: Colors.orange,),
          ),
        );
      }
    }
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
                        Consumer(builder: (context,ref,child){
                          int val = ref.watch(size_iden(widget.data_name));
                          return size(val);
                        })

                      ],
                    ),
                    SizedBox(height: sh*0.018,),
                Consumer(builder: (context,ref,child){
                  int count = ref.watch(counter(widget.data_name));

                  num Total = double.parse(widget.price) * (count > 0 ? count : 1);
                  return
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Data(text: "\$"+Total.toStringAsFixed(2),color: Colors.deepOrangeAccent,size: sw*0.047,),
                        Container(
                          height: sh*0.03,
                          width: sw * 0.4,

                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              GestureDetector(
                                onTap: (){
                                    count <= 1
                                        ? ref.read(counter(widget.data_name).notifier,).state = 1 :
                                    ref.read(counter(widget.data_name).notifier).state--;
                                },
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
                                text: count.toString(),
                                color: Colors.white,
                                size: sw * 0.05,
                              ),
                              SizedBox(width: sw*0.05,),
                              GestureDetector(
                                onTap: () {
                                  ref.read(counter(widget.data_name).notifier).state++;
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
                    );
                }),
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
