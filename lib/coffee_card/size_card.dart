import 'package:flutter/material.dart';

import '../home_page/text.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({
    super.key,
    required this.size,
    required this.weight,
    this.ontap,
    this.text_color,
    this.border_color
  });

  final String size;
  final String weight;
  final VoidCallback? ontap;
  final Color? text_color;
  final Color? border_color;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        width: sw * 0.28,
        height: sh * 0.08,
        decoration: BoxDecoration(
          color: Color(0xFF424242).withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(sw * 0.03),
          border: Border.all(
            color: border_color??Color(0xFF424242).withValues(alpha: 0.3),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Data(text: size,color: text_color??Colors.white,),
            Data(text: weight,color: Colors.grey[600],),

          ],
        ),
      ),
    );
  }
}
