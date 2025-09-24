import 'package:flutter/material.dart';

class Dessert extends StatelessWidget {
  const Dessert ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman dessert", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}