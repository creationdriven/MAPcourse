import 'package:flutter/material.dart';

class Driver extends StatelessWidget {
  static const String routeName = '/driver';

  const Driver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Driver")));
  }
}
