import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/chef.dart';
import 'package:resep_app_v2/screens/info_chef/chef_detail_screen.dart';

class ChefScreen extends StatelessWidget {
  final List<Chef> chefs;

  const ChefScreen({super.key, required this.chefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Daftar Chef'),
      ),
      body: ListView.builder(
        itemCount: chefs.length,
        itemBuilder: (context, index) {
          final chef = chefs[index];
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(chef.name),
            subtitle: Text(chef.specialty),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChefDetailScreen(chef: chef),
                ),
              );
            },
          );
        },
      ),
    );
  }
}