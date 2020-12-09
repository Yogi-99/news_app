import 'package:flutter/material.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/global/ui_state.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screens/article_detail/article_detail_screen.dart';
import 'package:news_app/services/article_service.dart';
import 'package:news_app/shared/show_message.dart';

class ArticleProvider extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();

  List<Article> _articles;
  List<Article> get articles => _articles ?? [];
  void _setArticles(List<Article> values) {
    _articles = values;
    notifyListeners();
  }

  Future<void> loadArticles() async {
    _changeUiStateToLoading();
    CustomResponse<List<Article>> response =
        await _articleService.getTopHeadlines();

    if (response.status == Status.ERROR) {
      _changeUiStateToIdle();
      ShowMessage.show(response.message);
      return;
    }

    _setArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  Article _selectedArticle;
  Article get selectedArticle => _selectedArticle;
  void selectArticle(Article value, BuildContext context) {
    _selectedArticle = value;
    Navigator.of(context).pushNamed(ArticleDetailScreen.id);
    notifyListeners();
  }

  // ********************** Search Bar ******************************

  String _searchTerm;
  String get searchTerm => _searchTerm ?? '';
  void onSearchTermChanged(String value) {
    _searchTerm = value;
    notifyListeners();
    _searchArticles();
  }

  void _searchArticles() async {
    if (searchTerm.trim().isEmpty) {
      loadArticles();
      return;
    }
    _changeUiStateToLoading();

    CustomResponse<List<Article>> response =
        await _articleService.searchArticles(searchTerm);

    if (response.status == Status.ERROR) {
      ShowMessage.show(response.message);
      _changeUiStateToIdle();
      return;
    }
    _setArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  // *************************** Ui State ********************************

  UiState _uiState;
  UiState get uiState => _uiState ?? UiState.idle;

  _changeUiStateToLoading() {
    _uiState = UiState.loading;
    notifyListeners();
  }

  _changeUiStateToIdle() {
    _uiState = UiState.idle;
    notifyListeners();
  }
}
