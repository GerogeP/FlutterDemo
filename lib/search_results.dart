import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String query;
  const SearchResultsPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('搜索结果')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('搜索：$query', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            const Text('（这里可以展示真实的搜索结果，占位示例）'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.search),
                    title: Text('结果 ${index + 1} - $query'),
                    subtitle: const Text('示例描述'),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('点击了结果 ${index + 1}')),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
