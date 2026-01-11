import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final members = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: members.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text(members[index][0])),
          title: Text(members[index]),
          subtitle: const Text('角色：成员'),
          trailing: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
