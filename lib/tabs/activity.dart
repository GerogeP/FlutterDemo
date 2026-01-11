import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => '动态事件 ${i + 1}');
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.flash_on, size: 18)),
          title: Text(items[index]),
          subtitle: const Text('最近发生的活动'),
        );
      },
    );
  }
}
