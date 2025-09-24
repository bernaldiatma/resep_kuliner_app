import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/kategori_list.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext contex) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: kategoriList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          final kategori = kategoriList[index];
          //final isSelected = index == selectIndex;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  contex, MaterialPageRoute(
                  builder: (contex) => kategori.kategoriScreen,
              ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      //border: Border.all(color: Colors.amber, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      kategori.icon,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    kategori.label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Urbanist",
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
