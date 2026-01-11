import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_manager_commulity/appbar.dart';
import 'package:project_manager_commulity/tabs/basic_info.dart';
import 'package:project_manager_commulity/tabs/issues.dart';
import 'package:project_manager_commulity/tabs/activity.dart';
import 'package:project_manager_commulity/tabs/community.dart';
import 'package:project_manager_commulity/tabs/members.dart';
import 'package:project_manager_commulity/tabs/settings.dart';


void main() {
  debugPaintSizeEnabled = false; // Set to true to enable the visual layout
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '项目管理——社区',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('zh'), // Chinese
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 186, 182, 194)),
      ),
      home: const MyHomePage(title: '项目管理', description: "项目管理——社区,这是一个项目管理社区的示例应用"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.description});

  final String title;
  final String description;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: MyAppBar(title: widget.title),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.1,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _buildDrawerItem(context, '主页'),
              _buildDrawerItem(context, '任务'),
              _buildDrawerItem(context, '营销'),
              _buildDrawerItem(context, '设计'),
              _buildDrawerItem(context, '广告'),
              _buildDrawerItem(context, '代码'),
              _buildDrawerItem(context, '接口'),
              _buildDrawerItem(context, '部署'),
              _buildDrawerItem(context, '文档'),
              _buildDrawerItem(context, '安全'),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: TabBarView(
          children: [
            // Tab 1: 基本信息
            BasicInfoPage(description: widget.description, counter: _counter),
            // Tab 2: 问题
            const IssuesPage(),
            // Tab 3: 动态
            const ActivityPage(),
            // Tab 4: 社区
            const CommunityPage(),
            // Tab 5: 项目成员
            const MembersPage(),
            // Tab 6: 项目设置
            const SettingsPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
