import 'package:flutter/material.dart';
import 'package:resep_app_v2/widgets/home/header.dart';
import 'package:resep_app_v2/widgets/home/sliding_panel_home.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          const Header(),
          const SlidingPanelHome(),
        ],
      ),
    );
  }
}