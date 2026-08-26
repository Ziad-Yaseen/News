import 'package:flutter/material.dart';
import 'package:news/app.dart';
import 'package:news/core/services/news_service.dart';

void main() {
  NewsService().GetNews();
  runApp(const News());
}
