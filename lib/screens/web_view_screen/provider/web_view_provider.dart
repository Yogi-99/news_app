import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../../global/ui_state.dart';
import '../../../provider/article_provider.dart';

class WebViewProvider extends ChangeNotifier {
  WebViewProvider(BuildContext context) {
    setUrl(
      Provider.of<ArticleProvider>(context, listen: false).selectedArticle.url,
    );
  }

  String _url;
  String get url => _url;
  void setUrl(String value) {
    _url = value;
    notifyListeners();
  }

  onPageStarted(String value) => _changeUiStateToLoading();

  onPageLoaded(String value) => _changeUiStateToIdle();

  UiState _uiState;
  UiState get uiState => _uiState ?? UiState.idle;

  bool get isLoading => (_uiState == UiState.loading) ?? false;

  _changeUiStateToLoading() {
    _uiState = UiState.loading;
    notifyListeners();
  }

  _changeUiStateToIdle() {
    _uiState = UiState.idle;
    notifyListeners();
  }
}
