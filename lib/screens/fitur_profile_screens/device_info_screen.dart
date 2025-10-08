import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

// Fungsi Asinkron untuk mendapatkan data perangkat
Future<Map<String, dynamic>> _getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return {
      'Sistem Operasi': 'Android ${androidInfo.version.release}',
      'Model Perangkat': androidInfo.model,
      'Versi SDK': androidInfo.version.sdkInt,
      'Pabrikan': androidInfo.manufacturer,
    };
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return {
      'Sistem Operasi': iosInfo.systemName,
      'Versi OS': iosInfo.systemVersion,
      'Model Perangkat': iosInfo.model,
      'Nama Perangkat': iosInfo.name,
    };
  }
  return {'Informasi': 'Platform tidak dikenal'};
}

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Perangkat'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getDeviceInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Tampilkan data dalam List
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: snapshot.data!.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(': '),
                      Expanded(child: Text(entry.value.toString())),
                    ],
                  ),
                );
              }).toList(),
            );
          }
          return const Center(child: Text('Tidak ada data perangkat yang tersedia.'));
        },
      ),
    );
  }
}