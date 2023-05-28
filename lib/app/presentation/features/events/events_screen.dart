import 'dart:ui';

import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static const route = '/events';

  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -150,
              left: -150,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: const Color(0xFF09FBD3).withOpacity(0.2)),
              )),
          Positioned(
              top: 200,
              right: -150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: const Color(0xFF09FBD3).withOpacity(0.2)),
              )),
          Positioned(
              bottom: -150,
              left: -150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: const Color(0xFF0af7e8).withOpacity(0.2)),
              )),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}
