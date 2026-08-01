import 'package:flutter/material.dart';
import 'package:news/features/home/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      sliver: SliverList.separated(
        itemCount: 10,
        itemBuilder: (context, index) => const NewsTile(),
        separatorBuilder: (context, index) => const SizedBox(height: 32),
      ),
    );
  }
}
