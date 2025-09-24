import 'package:flutter/material.dart';

class Populer extends StatelessWidget {
  const Populer ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman populer", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}