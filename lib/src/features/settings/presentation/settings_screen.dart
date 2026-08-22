import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.key_outlined),
            title: Text('Gemini API Key (Optional)'),
            subtitle: Text('Enable AI OCR fallback for complex PO documents'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Theme Mode'),
            subtitle: Text('System default'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Filful'),
            subtitle: const Text('Version 1.0.0 (Offline-First Supplier PO Fulfillment)'),
          ),
        ],
      ),
    );
  }
}
