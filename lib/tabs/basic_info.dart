import 'package:flutter/material.dart';

class BasicInfoPage extends StatelessWidget {
  final String description;
  final int counter;
  const BasicInfoPage({super.key, required this.description, required this.counter});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('项目简介', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Text('统计', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('计数器: $counter', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
