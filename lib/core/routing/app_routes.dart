import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/models/article_model.dart';
import 'package:news/core/routing/route_names.dart';
import 'package:news/features/article/screens/article_view.dart';
import 'package:news/features/category/screens/category_view.dart';
import 'package:news/features/home/screens/home.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Home(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      ),

      GoRoute(
        path: RouteNames.category,
        name: RouteNames.category,
        pageBuilder: (context, state) {
          final Map<String, String> extraData =
              state.extra as Map<String, String>;

          final String categoryName = extraData['category']!;
          final String pageTitle = extraData['title']!;

          return CustomTransitionPage(
            key: state.pageKey,
            child: CategoryView(category: categoryName, title: pageTitle),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 400),
          );
        },
      ),

      GoRoute(
        path: RouteNames.article,
        name: RouteNames.article,
        pageBuilder: (context, state) {
          final ArticleModel article = state.extra as ArticleModel;

          return CustomTransitionPage(
            key: state.pageKey,
            child: ArticleView(article: article),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 400),
          );
        },
      ),
    ],
  );
}
