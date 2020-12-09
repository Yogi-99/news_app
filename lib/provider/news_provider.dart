import 'package:flutter/material.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/global/ui_state.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/shared/show_message.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<Article> _articles;
  List<Article> get articles => _articles ?? [];
  void setArticles(List<Article> values) {
    _articles = values;
    notifyListeners();
  }

  Future<void> loadArticles() async {
    _changeUiStateToLoading();
    CustomResponse<List<Article>> response =
        await _newsService.getTopHeadlines();

    if (response.status == Status.ERROR) {
      _changeUiStateToIdle();
      ShowMessage.show(response.message);
      return;
    }

    setArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  // ********************** Search Bar ******************************

  String _searchTerm;
  String get searchTerm => _searchTerm ?? '';
  void onSearchTermChanged(String value) {
    _searchTerm = value;
    notifyListeners();
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
