import 'package:flutter/material.dart';

class Burger extends StatelessWidget {
  const Burger ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman burger", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}