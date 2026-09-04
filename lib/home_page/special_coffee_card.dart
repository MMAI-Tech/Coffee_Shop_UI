import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';

class SpecialCoffeeCard extends StatelessWidget {
  const SpecialCoffeeCard({
    super.key,
    required this.image_path,
    required this.name,
    this.type,
    this.price,
    this.ontap
  });
  final String image_path;
  final String name;
  final String? type;
  final String? price;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        height: sh*0.18,
        width: sw*0.9,
        decoration: BoxDecoration(
          color: Color(0xFF1E242E).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(sw*0.045),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: sw*0.35,
              height: sh*0.15,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(sw*0.04),
                  image: DecorationImage(image: AssetImage(image_path),fit: BoxFit.cover)
              ),
            ),
            Container(
                width: sw*0.45,
                height: sh*0.15,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Data(text: name,color: Colors.white,size: sw*0.05,),
                    SizedBox(height: sh*0.01,),
                    Data(text: type??'',color: Colors.white,),
                    SizedBox(height: sh*0.025,),
                    Row(
                      children: [
                        Icon(Icons.attach_money,color: Color(0xFFD17842),size: sw*0.055,),
                        Data(text: price??'0.0',color: Colors.white,size: sw*0.055,),
                        SizedBox(width: sw*0.19,),
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
                )

            ),
          ],
        ),
      ),
    );
  }
}
