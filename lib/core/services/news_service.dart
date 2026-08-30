import 'package:dio/dio.dart';
import 'package:news/core/constants/api_key.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/models/source_model.dart';

class NewsService {
  final Dio dio = Dio();

  /// Fetches the top headlines based on the provided [category].
  ///
  /// This method uses the News API to fetch the data.
  /// You can generate your own API key from: https://newsapi.org/
  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {'apiKey': ApiKey.apiKey, 'category': category},
      );
      List<dynamic> articles = response.data['articles'];
      List<ArticleModel> articleList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          author: article['author'] ?? 'Unknown Author',
          title: article['title'] ?? 'No title available',
          description: article['description'] ?? 'No description available',
          url: article['url'] ?? 'No URL available',
          image:
              article['urlToImage'] ??
              'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small_2x/no-image-available-icon-vector.jpg',
          publishedAt: article['publishedAt'] ?? 'No publish date available',
          content: article['content'] ?? 'No content available',
          source: SourceModel(
            id: article['source']['id'] ?? 'unknown_source',
            name: article['source']['name'] ?? 'Unknown Source',
          ),
        );

        articleList.add(articleModel);
      }

      return articleList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
