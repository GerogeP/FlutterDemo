import 'package:flutter/material.dart';

class IssuesPage extends StatelessWidget {
  const IssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple mock list of issues
    final items = List.generate(8, (i) => '问题 #${i + 1}');
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      separatorBuilder: (_, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          subtitle: const Text('问题简要描述'),
          leading: const Icon(Icons.report_problem_outlined),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        );
      },
    );
  }
}
