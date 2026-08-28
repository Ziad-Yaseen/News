import 'package:flutter/material.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/services/news_service.dart';
import 'package:news/features/home/widgets/news_tile.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    getMyNews();
  }

  Future<void> getMyNews() async {
    articles = await NewsService().getNews();
    setState(() {
      
    });
  }

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
