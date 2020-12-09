import 'package:flutter/material.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<Article> _articles;
  List<Article> get articled => _articles ?? [];
  void setArticles(List<Article> values) {
    _articles = values;
    notifyListeners();
  }

  loadArticles() async {
    CustomResponse response = await _newsService.getTopHeadlines();
  }
}
