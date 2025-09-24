import 'package:flutter/material.dart';

class Minuman extends StatelessWidget {
  const Minuman ({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman minuman", style: TextStyle(fontSize: 50),),
      ),
    );
  }
}