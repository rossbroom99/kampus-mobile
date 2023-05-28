import 'package:flutter/material.dart';

class MatchingScreen extends StatefulWidget {
  static const route = '/matching';
  MatchingScreen({Key? key}) : super(key: key);

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("matching screen"),
      ),
    );
  }
}
