import 'package:flutter/material.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/services/news_service.dart';
import 'package:news/features/home/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyNews();
  }

  Future<void> getMyNews() async {
    articles = await NewsService().getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 4.0,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          )
        : NewsListView(articles: articles);
  }
}
