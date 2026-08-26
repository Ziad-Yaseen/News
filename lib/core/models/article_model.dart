import 'package:news/core/models/source_model.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final String publishedAt;
  final String content;
  final SourceModel source;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

}