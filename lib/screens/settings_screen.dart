import 'package:flutter/material.dart';

/// A screen that shows the settings.
class SettingsScreen extends StatelessWidget {
  /// Constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          // TODO(me): Complete how to use the app
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(
              'アプリの使い方',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          // TODO(me): Complete the privacy policy site
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text(
              'プライバシーポリシーサイト',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          // TODO(me): Complete the display mode
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '表示モード',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'システム',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.unfold_more),
            onTap: () {},
          ),
          // TODO(me): Complete the data deletion
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: const Text(
              'データを削除',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
