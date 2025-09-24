import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kumpulan_resep.dart';

class ResepCardHorizontal extends StatelessWidget{
  final FoodRecipes recipes;

  const ResepCardHorizontal({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              child: Image.asset(recipes.imageAsset),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            ),
          ],
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            //border: Border.all(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16,bottom: 8),
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