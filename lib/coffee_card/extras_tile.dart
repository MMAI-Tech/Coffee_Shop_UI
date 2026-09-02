import 'package:flutter/material.dart';

import '../home_page/text.dart';

class ExtrasTile extends StatelessWidget {
  const ExtrasTile({
    super.key,
    required this.icon,
    required this.name,
    this.price,
    this.toggleValue,
    this.onTap

  });
  final IconData icon;
  final String name;
  final String? price;
  final bool? toggleValue;
  final VoidCallback? onTap;
  void onchange(bool newValue){
    onTap!();
  }


  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: sh * 0.1,
      margin: EdgeInsets.only(
        left: sw * 0.01,
        right: sw * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sw * 0.03),
        color: Color(0xFF424242).withValues(alpha: 0.1),
      ),
      child: Center(
        child: ListTile(
          leading: Container(
            width: sw * 0.11,
            height: sh * 0.055,
            decoration: BoxDecoration(
              color: Color(0xFF0C0F14),
              borderRadius: BorderRadius.circular(sw * 0.02),
              border: Border.all(
                color: Color(0xFF424242).withValues(alpha: 0.8),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.deepOrange,
            ),
          ),
          title: Data(
            text: name,
            color: Colors.white,
            size: sw * 0.05,
          ),
          subtitle: Row(
            children: [
              Data(text: "\$",color: Colors.deepOrange,),
              Data(
                text: price??"0.0",
                color: Colors.deepOrange,
              ),
            ],
          ),
          trailing: Switch(
            value: toggleValue??false,
            onChanged: onchange,
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.deepOrange,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Color(0xFF0C0F14),
          ),
        ),
      ),
    );
  }
}
