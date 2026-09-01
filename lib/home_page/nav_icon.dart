import 'package:flutter/material.dart';

class NavIcon extends StatelessWidget {

  const NavIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.color

  });
  final IconData icon;
  final VoidCallback? onTap;
 final Color? color;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return IconButton(onPressed: onTap, icon: Icon(icon,color: color?? Colors.grey[800],size: sw*0.07,)
    );
  }
}
