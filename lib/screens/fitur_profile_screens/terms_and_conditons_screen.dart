import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditonsScreen extends StatelessWidget {
  const TermsAndConditonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller untuk mengatur WebView
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.google.com/policies/terms/'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syarat dan Ketentuan'),
        backgroundColor: Colors.orange, // Sesuaikan dengan tema Anda
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}