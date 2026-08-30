import 'package:flutter/material.dart';
import 'package:news/core/helpers/article_action_section.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/features/article/widgets/article_app_bar.dart';
import 'package:news/features/article/widgets/article_data.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.width * (316 / 430);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ArticleAppBar(imageHeight: imageHeight, image: article.image),
          ArticleData(
            title: article.title,
            author: article.author,
            date: article.publishedAt,
            content: article.content,
          ),
          ArticleActionSection(url: article.url),
        ],
      ),
    );
  }
}
