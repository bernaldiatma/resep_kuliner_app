import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kumpulan_resep.dart';
import '../../widgets/card/resep_card2.dart';
import '../info_resep/detail_resep.dart';

class SearcingScreen extends StatefulWidget {
  const SearcingScreen({Key? key}) : super(key: key);

  @override
  State<SearcingScreen> createState() => _SearchingScreen();
}

class _SearchingScreen extends State<SearcingScreen> {
  final List<FoodRecipes> _listResep = foodRecipesList;
  List<FoodRecipes> _foundResep = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _foundResep = _listResep;
    super.initState();
  }

  void _runFilter(String enteKeyword) {
    List<FoodRecipes> result = [];
    if (enteKeyword.isEmpty) {
      result = _listResep;
    } else {
      result = _listResep
          .where(
            (resep) =>
                resep.name.toLowerCase().contains(enteKeyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      _foundResep = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 16, top: 8),
                  child: Text(
                    "Cari resep favoritmu",
                    style: TextStyle(fontSize: 26, fontFamily: "UrbanistBold"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(
                controller: _controller,
                hintText: "Cari resep...",
                leading: const Icon(Icons.search),
                trailing: [
                  if (_controller.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          _foundResep = foodRecipesList;
                        });
                      },
                    ),
                ],
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                hintStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: "Urbanist",
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Urbanist",
                  ),
                ),
                onChanged: (value) => _runFilter(value),
              ),
            ),

            // Dibawah adalah versi pakai TextField()
            /*
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  labelText: "Cari resep",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            */
            SizedBox(height: 24),
            Expanded(
              child: _foundResep.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundResep.length,
                      itemBuilder: (context, index) {
                        final resep = _foundResep[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailResep(recipes: resep),
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
                    )
                  : const Center(
                      child: Text(
                        "Resep tidak ditemukan",
                        style: TextStyle(
                          fontSize: 25,
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
