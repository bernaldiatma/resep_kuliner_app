import 'package:flutter/material.dart';

class TombolLogout extends StatelessWidget{
  const TombolLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contex) {
    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.orange[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.power_settings_new, color: Colors.white),
            SizedBox(width: 5),
            Text(
              "Logout",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Urbanist",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}