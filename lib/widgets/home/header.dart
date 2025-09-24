import 'package:flutter/material.dart';
import 'package:resep_app_v2/widgets/home/scroll_kategori.dart';

import '../../model/user_data.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      decoration: BoxDecoration(
        color: Colors.orange[800],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/images/diego.jpg"),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Halo,${UserData.username ?? "User"} !👋",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: "Urbanist",
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black12,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 33,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16),
              child: Row(
                children: [
                  Text(
                    "Apa yang ingin kamu\nmasak hari ini?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  const Text(
                    "Kategori",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Urbanist"
                    ),
                  ),
                ],
              ),
            ),*/
            SizedBox(height: 16),
            const Kategori(),
          ],
        ),
      ),
    );
  }
}
