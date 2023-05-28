import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  static const route = '/messages';
  MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("messages screen"),
      ),
    );
  }
}
