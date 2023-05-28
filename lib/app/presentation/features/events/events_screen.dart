import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static const route = '/events';

  EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Events page"),
    ));
  }
}
