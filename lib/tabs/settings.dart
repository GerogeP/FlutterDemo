import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('常规设置'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('权限与隐私'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('通知设置'),
          onTap: () {},
        ),
      ],
    );
  }
}
