import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.image_path,
    this.rating,
    required this.name,
    this.type,
    this.price,
  });
  final String image_path;
  final String? rating;
  final String name;
  final String? type;
  final String? price;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return  Container(
      height: sh*0.31,
      width: sw*0.41,
      decoration: BoxDecoration(
          color: Color(0xFF1E242E).withValues(alpha: 0.4),

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
                  image: DecorationImage(image: AssetImage(image_path),fit: BoxFit.cover)
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
                    Data(text: rating??'0.0',color: Colors.white,size: sw*0.03,)
                  ],
                ),
              )
              ,
            ),
            Data(text: name,color: Colors.white54,size: sw*0.05,),
            Data(text: type??'',color: Colors.white54,size: sw*0.03,),
            SizedBox(height: sh*0.01,),
            Row(
              children: [
                Icon(Icons.attach_money,color: Color(0xFFD17842),size: sw*0.047,),
                Data(text: price??"0.0",color: Colors.white,size: sw*0.047,),
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
    );
  }
}
