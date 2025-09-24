import 'package:flutter/material.dart';
import 'package:resep_app_v2/model/chef.dart';
import 'package:resep_app_v2/model/dessert_chef.dart';

class ChefDetailScreen extends StatelessWidget {
  final Chef chef;

  const ChefDetailScreen({super.key, required this.chef});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chef.name),
        backgroundColor: Colors.orange[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 80, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              chef.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Spesialisasi: ${chef.specialty}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              'Pengalaman: ${chef.experienceYears} tahun',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan SnackBar sebagai feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        (chef is DessertChef) ?
                        '${chef.name} sedang membuat dessert!' :
                        '${chef.name} sedang memasak!',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  // Panggil method cook()
                  chef.cook();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Tampilkan Aksi Memasak', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}