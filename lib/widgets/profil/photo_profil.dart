import 'package:flutter/material.dart';

class PhotoProfil extends StatelessWidget {
  const PhotoProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/diego.jpg",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Bernaldi Atma",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "UrbanistBold",
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "@AizenSousuke",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Urbanist",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "Premium",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "UrbanistBold",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}