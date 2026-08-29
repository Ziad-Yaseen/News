import 'package:flutter/material.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/features/home/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      sliver: SliverList.separated(
        itemCount: articles.length,
        itemBuilder: (context, index) => NewsTile(article: articles[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 32),
      ),
    );
  }
}
