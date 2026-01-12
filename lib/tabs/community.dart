import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(13), // 0.05 opacity
            Theme.of(context).colorScheme.secondary.withAlpha(13), // 0.05 opacity
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 左侧内容区域 - 占三分之二宽度
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab Bar
                  SizedBox(
                    height: 50.0, // 设置TabBar高度为50
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabs: const [
                        Tab(text: '推荐'),
                        Tab(text: '项目'),
                        Tab(text: '问题'),
                        Tab(text: '专栏'),
                        Tab(text: '科普'),
                        Tab(text: '文章'),
                        Tab(text: '咨询'),
                        Tab(text: '创意'),
                        Tab(text: '视频'),
                        Tab(text: '其他'),
                      ],
                      indicatorColor: Colors.transparent, // 隐藏默认指示器
                      indicatorWeight: 0.0, // 完全移除下边框
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(128),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, // 设置选中标签字体为粗体
                      ), // 设置选中标签字体大小为14
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 14,
                      ), // 设置未选中标签字体大小为14
                      indicatorSize: TabBarIndicatorSize.tab, // 指示器大小与标签一致
                      dividerHeight: 0.0, // 移除底部分割线
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, // 增加水平内边距
                        vertical: 12.0, // 增加垂直内边距
                      ),
                      // 自定义指示器，添加边框和阴影效果
                      indicator: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(
                            20,
                            18,
                            17,
                            42,
                          ), // 12112A, 8%透明度
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tab Bar View
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildCommunityList('推荐'),
                        _buildCommunityList('项目'),
                        _buildCommunityList('问题'),
                        _buildCommunityList('专栏'),
                        _buildCommunityList('科普'),
                        _buildCommunityList('文章'),
                        _buildCommunityList('咨询'),
                        _buildCommunityList('创意'),
                        _buildCommunityList('视频'),
                        _buildCommunityList('其他'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // 右侧内容区域 - 占三分之一宽度
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // 上端：AppBar
                  AppBar(
                    title: const Text('创意空间', style: TextStyle(fontSize: 18)),
                    leading: const Icon(Icons.lightbulb_outlined),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    centerTitle: false,
                    titleSpacing: 4,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          children: const [
                            Icon(Icons.edit_note_outlined),
                            SizedBox(width: 4),
                            Text('草稿', style: TextStyle(fontSize: 13)),
                            SizedBox(width: 2),
                            Text('(0)', style: TextStyle(fontSize: 13)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 下端：TabController
                  Expanded(
                    child: DefaultTabController(
                      length: 6,
                      child: Column(
                        children: [
                          // TabBar
                          TabBar(
                            tabs: const [
                              Tab(
                                icon: Icon(
                                  Icons.science_outlined,
                                  color: Colors.blue,
                                ),
                                text: '科普',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.article_outlined,
                                  color: Colors.green,
                                ),
                                text: '专栏',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.question_answer_outlined,
                                  color: Colors.purple,
                                ),
                                text: '回答问题',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.lightbulb_outlined,
                                  color: Colors.yellow,
                                ),
                                text: '创意',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.post_add_outlined,
                                  color: Colors.orange,
                                ),
                                text: '文章',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.video_collection_outlined,
                                  color: Colors.red,
                                ),
                                text: '视频',
                              ),
                            ],
                            isScrollable: false,
                            labelColor: Theme.of(context).colorScheme.primary,
                            unselectedLabelColor: Theme.of(
                              context,
                            ).colorScheme.outline,
                            indicatorColor: Colors.transparent, // 隐藏默认指示器
                            indicatorWeight: 0.0, // 完全移除下边框
                            labelStyle: const TextStyle(fontSize: 12),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerHeight: 0.0, // 移除底部分割线
                            automaticIndicatorColorAdjustment: true,
                            // 自定义指示器，添加边框和阴影效果
                            indicator: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(
                                  20,
                                  18,
                                  17,
                                  42,
                                ), // 12112A, 8%透明度
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          // TabBarView
                          Expanded(
                            child: TabBarView(
                              children: [
                                // 科普页面
                                _buildRightTabContent('科普'),
                                // 专栏页面
                                _buildRightTabContent('专栏'),
                                // 回答问题页面
                                _buildRightTabContent('回答问题'),
                                // 创意页面
                                _buildRightTabContent('创意'),
                                // 文章页面
                                _buildRightTabContent('文章'),
                                // 视频页面
                                _buildRightTabContent('视频'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityList(String tabTitle) {
    // 使用GridView实现每行两个卡片
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行显示两个卡片
        crossAxisSpacing: 12, // 水平间距
        mainAxisSpacing: 12, // 垂直间距
        childAspectRatio: 4.0, // 增加宽高比，减少卡片高度
      ),
      itemCount: 10, // 显示10个卡片
      shrinkWrap: true, // 当GridView嵌套在Column中时需要设置shrinkWrap
      physics: const NeverScrollableScrollPhysics(), // 禁用GridView自身滚动
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 第一行：标题，分左右两块
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 左侧：火焰outlined图标和标题粗体文本
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department_outlined,
                        size: 14,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$tabTitle 项目标题 $index',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  // 右侧：outlined star图标和数字13
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text('13', style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              // 第二行：简介，正常字体，大小13
              Text(
                '这是项目的简短简介',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              // 第三行：统计，瘦体，大小13
              Text(
                'Python · 10分钟前 · 分享',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300, // 瘦体
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.primary.withAlpha(26), // 0.1 opacity
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  // 右侧TabBarView的内容构建方法
  Widget _buildRightTabContent(String tabTitle) {
    // 根据tabTitle获取对应的图标和颜色
    IconData iconData = Icons.folder;
    Color iconColor = Colors.blue;

    switch (tabTitle) {
      case '科普':
        iconData = Icons.science_outlined;
        iconColor = Colors.blue;
        break;
      case '专栏':
        iconData = Icons.article_outlined;
        iconColor = Colors.green;
        break;
      case '回答问题':
        iconData = Icons.question_answer_outlined;
        iconColor = Colors.purple;
        break;
      case '创意':
        iconData = Icons.lightbulb_outlined;
        iconColor = Colors.yellow;
        break;
      case '文章':
        iconData = Icons.post_add_outlined;
        iconColor = Colors.orange;
        break;
      case '视频':
        iconData = Icons.video_collection_outlined;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.folder;
        iconColor = Colors.blue;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // 第一个卡片
                Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(iconData, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            Text(
                              '${tabTitle}的项目',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // 9个无序列表项
                        for (int i = 1; i <= 9; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '列表项 $i',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // 第二个卡片
                Card(
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(iconData, size: 18, color: iconColor),
                            const SizedBox(width: 8),
                            Text(
                              '${tabTitle}的专栏',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // 9个无序列表项
                        for (int i = 1; i <= 9; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '列表项 $i',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
