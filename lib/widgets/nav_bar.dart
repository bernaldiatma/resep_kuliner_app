import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      //color: Colors.orange.shade800,
      //buttonBackgroundColor: Colors.grey.shade200,
      color: Colors.orange.withOpacity(0.1),
      buttonBackgroundColor: Colors.orange[800],
      backgroundColor: Colors.white,
      onTap: onTap,
      index: currentIndex,
      items: [
        Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined, size: 30),
        Icon(
          currentIndex == 1 ? Icons.search : Icons.search_outlined,
          size: 30,
        ),
        Icon(
          currentIndex == 2 ? Icons.star : Icons.star_outline,
          size: 30,
        ),
        Icon(
          currentIndex == 3 ? Icons.person_2 : Icons.person_2_outlined,
          size: 30,
        ),
      ],
    );
  }
}
