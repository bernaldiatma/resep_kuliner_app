import 'package:flutter/material.dart';

class Bekal extends StatelessWidget {
  const Bekal ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman bekal", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}