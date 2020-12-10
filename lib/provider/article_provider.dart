import 'package:flutter/material.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/global/ui_state.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/screens/article_detail/article_detail_screen.dart';
import 'package:news_app/screens/home/provider/home_provider.dart';
import 'package:news_app/services/article_service.dart';
import 'package:news_app/services/author_service.dart';
import 'package:news_app/services/source_service.dart';
import 'package:news_app/shared/show_message.dart';
import 'package:provider/provider.dart';

class ArticleProvider extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  final AuthService _authService = AuthService();
  final SourceService _sourceService = SourceService();

  init() async {
    _loadTopHeadlineArticles();
    await _getAllSources();
    _loadExploreArticles();
  }

  Article _selectedArticle;
  Article get selectedArticle => _selectedArticle;
  void selectArticle(Article value, BuildContext context) {
    _selectedArticle = value;
    setAuthorProfileImage(null);
    _getRandomAuthorImage();
    Navigator.of(context).pushNamed(ArticleDetailScreen.id);
    notifyListeners();
  }

  // ********************* Top Headlines *********************

  List<Article> _topHeadlinesArticles;
  List<Article> get topHeadlineArticles => _topHeadlinesArticles ?? [];
  void _setTopHeadlineArticles(List<Article> values) {
    _topHeadlinesArticles = values;
    notifyListeners();
  }

  Future<void> _loadTopHeadlineArticles() async {
    _changeUiStateToLoading();
    CustomResponse<List<Article>> response =
        await _articleService.getTopHeadlines();

    if (response.status == Status.ERROR) {
      _changeUiStateToIdle();
      ShowMessage.show(response.message);
      return;
    }

    _setTopHeadlineArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  // ********************* Explore *********************

  List<Article> _exploreArticles;
  List<Article> get exploreArticles => _exploreArticles ?? [];
  void _setExploreArticles(List<Article> values) {
    _exploreArticles = values;
    notifyListeners();
  }

  Future<void> _loadExploreArticles() async {
    _changeUiStateToLoading();
    CustomResponse<List<Article>> response =
        await _articleService.getExploreArticles(selectedSource);

    if (response.status == Status.ERROR) {
      _changeUiStateToIdle();
      // ShowMessage.show(response.message);
      return;
    }

    _setExploreArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  // *********************** Sources *****************************

  List<Source> _sources;
  List<Source> get sources => _sources ?? [];
  void setSources(List<Source> values) {
    _setExploreArticles(null);
    _sources = values;
    notifyListeners();
  }

  Source _selectedSource;
  Source get selectedSource => _selectedSource;
  void selectSource(Source value) {
    _selectedSource = value;
    _loadExploreArticles();
    notifyListeners();
  }

  Future<void> _getAllSources() async {
    CustomResponse<List<Source>> response =
        await _sourceService.getAllSources();

    if (response.status == Status.ERROR) return;

    setSources(response.data);
    selectSource(sources.first);
    return;
  }

  // ********************** Search Bar ******************************

  String _searchTerm;
  String get searchTerm => _searchTerm ?? '';
  void onSearchTermChanged(String value, BuildContext context) {
    _searchTerm = value;
    notifyListeners();
    Provider.of<HomeProvider>(context, listen: false).selectedTabIndex == 0
        ? _searchTopHeadlines()
        : _searchExploreArticles();
  }

  void _searchTopHeadlines() async {
    if (searchTerm.trim().isEmpty || searchTerm.trim().length <= 2) {
      _loadTopHeadlineArticles();
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
    _setTopHeadlineArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  void _searchExploreArticles() async {
    if (searchTerm.trim().isEmpty || searchTerm.trim().length <= 2) {
      _loadExploreArticles();
      return;
    }
    _changeUiStateToLoading();

    CustomResponse<List<Article>> response =
        await _articleService.searchArticles(searchTerm, selectedSource);

    if (response.status == Status.ERROR) {
      ShowMessage.show(response.message);
      _changeUiStateToIdle();
      return;
    }
    _setExploreArticles(response.data);
    _changeUiStateToIdle();
    return;
  }

  // *************************** Random author profile images ********************************

  String _authorProfileImage;
  String get authorProfileImage => _authorProfileImage ?? '';
  void setAuthorProfileImage(String value) {
    _authorProfileImage = value;
    notifyListeners();
  }

  Future<void> _getRandomAuthorImage() async {
    CustomResponse<String> response = await _authService.getRandomAuthorImage();

    if (response.status == Status.ERROR) return;

    setAuthorProfileImage(response.data);
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

  bool get noArticleInTopHeadings =>
      uiState == UiState.idle && topHeadlineArticles.length == 0;

  bool get noArticlesInExplore =>
      uiState == UiState.idle && exploreArticles.length == 0;
}
