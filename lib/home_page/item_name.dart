import 'package:coffee_shop_ui/home_page/text.dart';
import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    super.key,
    required this.name,
    this.color,
    this.toggle,
    this.ontap
  });
  final String name;
  final Color? color;
  final bool? toggle;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return   Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Data(
            text: name,
            color: color??Colors.grey[800],
            size: sw * 0.047,
          ),
        ),
        if(toggle??false)
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
    );
  }
}
