import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kumpulan_resep.dart';

class ResepCard extends StatelessWidget{
  final FoodRecipes recipes;

  const ResepCard({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            child: Image.asset(recipes.imageAsset),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
            gradient: LinearGradient(
              stops: [0.13, 0.2, 0.4, 1],
              colors: [
                Colors.white,
                Colors.white70,
                Colors.black38,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        recipes.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: "UrbanistBold",
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      recipes.rating,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: "UrbanistBold",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}