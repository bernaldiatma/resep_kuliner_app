import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Format Tanggal Lokal (intl)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          // Demonstrasi format tanggal Indonesia
          ListTile(
            title: const Text('Tanggal Hari Ini:'),
            subtitle: Text(
              DateFormat.yMMMMEEEEd('id_ID').format(now),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Opsi Aplikasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            trailing: Switch(
              value: _isNotificationsEnabled, // Mengambil nilai dari state
              onChanged: (val) {
                // Memperbarui state saat Switch diubah
                setState(() {
                  _isNotificationsEnabled = val;
                });
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            trailing: const Text('Indonesia'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
