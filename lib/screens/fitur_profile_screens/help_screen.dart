import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('FAQ (Pertanyaan Umum)'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Hubungi Dukungan'),
            subtitle: Text('Email kami di support@resepkuliner.com'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Panduan Pengguna'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}