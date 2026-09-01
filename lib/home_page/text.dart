import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  const Data({super.key, required this.text, this.size, this.color});

  final String text;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color??Colors.grey[800],fontWeight: FontWeight.bold),
    );
  }
}
