import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kumpulan_resep.dart';
import 'package:readmore/readmore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailResep extends StatelessWidget {
  final FoodRecipes recipes;

  const DetailResep({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 320,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.fill,
              child: Image.asset(recipes.imageAsset),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 800) {
                  return SlidingPanelWeb(recipes: recipes);
                } else {
                  return SlidingPanel(recipes: recipes);
                }
              }
          ),
        ],
      ),
    );
  }
}

class SlidingPanel extends StatelessWidget {
  final FoodRecipes recipes;

  SlidingPanel({Key? key, required this.recipes}) : super(key: key);

  PanelController _panelController = PanelController();

  void togglePanel() => _panelController.isPanelOpen
      ? _panelController.close()
      : _panelController.open();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SlidingUpPanel(
      controller: _panelController,
      maxHeight: size.height * 0.946,
      minHeight: size.height * 0.683,
      panelBuilder: (controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: togglePanel,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16, bottom: 10),
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      recipes.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange[800],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.black, size: 25),
                          const SizedBox(width: 4),
                          Text(
                            recipes.rating,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Urbanist",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ReadMoreText(
                          recipes.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontFamily: "Urbanist",
                          ),
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.black,
                          trimCollapsedText: 'Baca Selengkapnya',
                          trimExpandedText: ' ..Sembunyikan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: InformasiTambahanResep(recipes: recipes),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bahan-bahan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: recipes.ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = recipes.ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 20,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "•    ",
                                  style: TextStyle(
                                    color: Colors.orange[800],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                TextSpan(
                                  text: "$ingredient",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Urbanist",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 26),
                    Text(
                      "Instruksi memasak",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: recipes.instructions.length,
                      itemBuilder: (context, index) {
                        final instruction = recipes.instructions[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "•    ",
                                style: TextStyle(
                                  color: Colors.orange[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  instruction,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Urbanist",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}

class SlidingPanelWeb extends StatelessWidget {
  final FoodRecipes recipes;

  SlidingPanelWeb({Key? key, required this.recipes}) : super(key: key);

  PanelController _panelController = PanelController();

  void togglePanel() => _panelController.isPanelOpen
      ? _panelController.close()
      : _panelController.open();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SlidingUpPanel(
      controller: _panelController,
      maxHeight: size.height * 0.946,
      minHeight: size.height * 0.77,
      panelBuilder: (controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: togglePanel,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16, bottom: 10),
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      recipes.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "inter",
                      ),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.black, size: 25),
                          const SizedBox(width: 4),
                          Text(
                            recipes.rating,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Urbanist",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ReadMoreText(
                          recipes.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontFamily: "Urbanist",
                          ),
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.black,
                          trimCollapsedText: 'Baca Selengkapnya',
                          trimExpandedText: ' ..Sembunyikan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: InformasiTambahanResep(recipes: recipes),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bahan-bahan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: recipes.ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = recipes.ingredients[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 20,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "•    ",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Urbanist",
                                  ),
                                ),
                                TextSpan(
                                  text: "$ingredient",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Urbanist",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 26),
                    Text(
                      "Instruksi memasak",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Urbanist",
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: recipes.instructions.length,
                      itemBuilder: (context, index) {
                        final instruction = recipes.instructions[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "•    ",
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Urbanist",
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  instruction,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Urbanist",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}

class InformasiTambahanResep extends StatelessWidget {
  final FoodRecipes recipes;

  const InformasiTambahanResep({Key? key, required this.recipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: const Icon(Icons.access_time, size: 35),
                      ),
                      SizedBox(height: 3),
                      Text(
                        recipes.time,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                      Text(
                        "Menit",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 9,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: const Icon(Icons.group, size: 35),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        recipes.porsi,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                      Text(
                        "Orang",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 9,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: const Icon(
                          Icons.local_fire_department,
                          size: 35,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        recipes.kalori,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                      const Text(
                        "Kcal",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 9,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: const Icon(Icons.layers, size: 35),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        recipes.dificult,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}