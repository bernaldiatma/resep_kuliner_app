import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/chef_data.dart';
import 'package:resep_app_v2/screens/halaman_utama/chef_screen.dart';
import 'package:resep_app_v2/screens/halaman_utama/profil_screen.dart';
import 'package:resep_app_v2/widgets/nav_bar.dart';
import 'package:resep_app_v2/screens/halaman_utama/home_screen.dart';
import 'package:resep_app_v2/screens/halaman_utama/search_recipe_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearcingScreen(),
    ChefScreen(chefs: chefsList),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      ),
    );
  }
}