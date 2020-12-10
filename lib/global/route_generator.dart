import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/screens/web_view_screen/web_view_screen.dart';
import '../screens/article_detail/article_detail_screen.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case ArticleDetailScreen.id:
        return MaterialPageRoute(
          builder: (context) => ArticleDetailScreen(),
        );

      case WebViewScreen.id:
        return MaterialPageRoute(
          builder: (context) => WebViewScreen(),
        );

      default:
    }
  }
}
