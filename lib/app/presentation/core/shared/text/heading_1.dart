import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Heading1 extends StatefulWidget {
  final String text;
  const Heading1({super.key, required this.text});

  @override
  State<Heading1> createState() => _Heading1State();
}

class _Heading1State extends State<Heading1> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(fontSize: 33.sp, fontWeight: FontWeight.w600));
  }
}
