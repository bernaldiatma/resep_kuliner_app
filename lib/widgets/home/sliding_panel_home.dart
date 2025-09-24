import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kumpulan_resep.dart';
import 'package:resep_app_v2/screens/info_resep/detail_resep.dart';
import 'package:resep_app_v2/widgets/card/resep_card.dart';
import 'package:resep_app_v2/widgets/card/resep_card2.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanelHome extends StatelessWidget {
  const SlidingPanelHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SlidingUpPanel(
      maxHeight: size.height * 0.865,
      minHeight: size.height * 0.56,
      panelBuilder: (controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: const Text(
                  "Resep Populer",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "UrbanistBold",
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(color: Colors.transparent),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final resep = foodRecipesList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailResep(recipes: resep),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: ResepCard(recipes: resep),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: const Text(
                  "Resep Lainnya",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "UrbanistBold",
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: foodRecipesList.length,
                itemBuilder: (context, index) {
                  final resep = foodRecipesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailResep(recipes: resep),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ResepCardHorizontal(recipes: resep),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    );
  }
}
