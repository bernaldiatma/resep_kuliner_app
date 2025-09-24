import 'package:flutter/material.dart';

class Pizza extends StatelessWidget {
  const Pizza ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman pizza", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}