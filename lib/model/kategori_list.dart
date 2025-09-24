import 'package:flutter/material.dart';
import 'package:resep_app_v2/screens/kategori_screen/bekal.dart';
import 'package:resep_app_v2/screens/kategori_screen/burger.dart';
import 'package:resep_app_v2/screens/kategori_screen/dessert.dart';
import 'package:resep_app_v2/screens/kategori_screen/jepang.dart';
import 'package:resep_app_v2/screens/kategori_screen/minuman.dart';
import 'package:resep_app_v2/screens/kategori_screen/pizza.dart';
import 'package:resep_app_v2/screens/kategori_screen/populer.dart';

class Kategori {
  final IconData icon;
  final String label;
  final Widget kategoriScreen;

  Kategori(this.icon, this.label,this.kategoriScreen);

}

final List<Kategori> kategoriList = [
  Kategori(Icons.local_fire_department, "Populer", const Populer()),
  Kategori(Icons.local_cafe, "Minuman", const Minuman()),
  Kategori(Icons.icecream, "Dessert", const Dessert()),
  Kategori(Icons.fastfood, "Burger", const Burger()),
  Kategori(Icons.local_pizza,"Pizza", const Pizza()),
  Kategori(Icons.ramen_dining, "Jepang", const Jepang()),
  Kategori(Icons.set_meal, "Bekal", const Bekal()),
];