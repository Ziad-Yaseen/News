import 'package:dio/dio.dart';
import 'package:news/core/constants/api_key.dart';
import 'package:news/core/models/article_model.dart';

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

      return articles.map((article) => ArticleModel.fromJson(article)).toList();
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}