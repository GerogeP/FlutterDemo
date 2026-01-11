
import 'package:flutter/material.dart';
import 'package:project_manager_commulity/search_results.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onSecondary,
      elevation: 14,
      child: SafeArea(
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Builder(builder: (context) {
                  return SizedBox(
                    width: 40,
                    height: 40,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        final scaffold = Scaffold.of(context);
                        if (scaffold.isDrawerOpen) {
                          Navigator.of(context).pop();
                        } else {
                          scaffold.openDrawer();
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'images/琅寰文件.jpg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return Center(
                              child: IconButton(
                                icon: const Icon(Icons.menu),
                                iconSize: 20,
                                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                onPressed: () {
                                  final scaffold = Scaffold.of(context);
                                  if (scaffold.isDrawerOpen) {
                                    Navigator.of(context).pop();
                                  } else {
                                    scaffold.openDrawer();
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),

              // Title
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(width: 12),

              // Tabs in the same row with horizontal padding
              Expanded(
                child: Padding(
                   padding: const EdgeInsets.only(left: 48.0, right: 24.0),
                  child: Center(
                    child: TabBar(
                     isScrollable: true,
                    tabs: const [
                      Tab(child: Text('基本信息', softWrap: false)),
                      Tab(child: Text('问题', softWrap: false)),
                      Tab(child: Text('动态', softWrap: false)),
                      Tab(child: Text('社区', softWrap: false)),
                      Tab(child: Text('项目成员', softWrap: false)),
                      Tab(child: Text('项目设置', softWrap: false)),
                    ],
                    labelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.95),
                    unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
              ),

              // Actions: search field and login button
              SizedBox(
                width: 240,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    hintText: '请输入内容',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.06),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    if (value.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请输入搜索内容')),
                      );
                      return;
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SearchResultsPage(query: value.trim()),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (ctx) {
                      final usernameController = TextEditingController();
                      final passwordController = TextEditingController();
                      return AlertDialog(
                        title: const Text('登录/注册'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: usernameController,
                              decoration: const InputDecoration(labelText: '用户名'),
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(labelText: '密码'),
                              obscureText: true,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('取消'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final username = usernameController.text.trim();
                              final password = passwordController.text;
                              if (username.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('请输入用户名和密码')),
                                );
                                return;
                              }
                              Navigator.of(ctx).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('已登录：$username')),
                              );
                            },
                            child: const Text('登录/注册'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('登录/注册'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}