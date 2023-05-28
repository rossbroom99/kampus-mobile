import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  static const route = '/groups';
  GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Groups screen")),
    );
  }
}
