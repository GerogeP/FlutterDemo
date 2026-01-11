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
                  TabBar(
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
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  const SizedBox(height: 16),
                  // Tab Bar View
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildCreativeList('推荐'),
                        _buildCreativeList('项目'),
                        _buildCreativeList('问题'),
                        _buildCreativeList('专栏'),
                        _buildCreativeList('科普'),
                        _buildCreativeList('文章'),
                        _buildCreativeList('咨询'),
                        _buildCreativeList('创意'),
                        _buildCreativeList('视频'),
                        _buildCreativeList('其他'),
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
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 从左侧移动过来的内容
                      Text('创意空间', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                      const SizedBox(height: 8),
                      Text('在这里展示社区创意和讨论', style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add_comment),
                          label: const Text('发布创意'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 原有右侧内容
                      Text('热门创意', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 16),
                      // 热门创意列表
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary.withAlpha(26), // 0.1 opacity
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      '热门创意话题 ${index + 1}',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 创意分类
                      Text('创意分类', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildCategoryChip(context, '项目管理'),
                          _buildCategoryChip(context, '设计创意'),
                          _buildCategoryChip(context, '技术实现'),
                          _buildCategoryChip(context, '用户体验'),
                          _buildCategoryChip(context, '市场推广'),
                          _buildCategoryChip(context, '团队协作'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreativeList(String tabTitle) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$tabTitle ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('这是一个关于项目管理的创意想法，欢迎大家参与讨论。'),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment),
                      label: const Text('评论'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text('点赞'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(26), // 0.1 opacity
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
