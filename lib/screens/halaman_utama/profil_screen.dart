import 'package:flutter/material.dart';
import 'package:resep_app_v2/widgets/profil/photo_profil.dart';
import 'package:resep_app_v2/widgets/profil/fitur_ptofil_lainnya.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Container(
      //       height: double.infinity,
      //       width: double.infinity,
      //       color: Colors.grey.shade200,
      //     ),
      //     Container(
      //         height: 300,
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.bottomCenter,
      //           end: Alignment.topCenter,
      //           colors: [
      //             Colors.orange.shade800,
      //             Colors.orange.shade500,
      //           ],
      //         ),
      //       ),
      //     ),
      //     SafeArea(
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 24),
      //         child: Column(
      //           children: [
      //             Text(
      //               "Informasi Profil",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontFamily: "UrbanistBold",
      //               ),
      //             ),
      //             SizedBox(height: 16),
      //             PhotoProfil(),
      //             SizedBox(height: 16),
      //             FiturProfilLainnya(),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
