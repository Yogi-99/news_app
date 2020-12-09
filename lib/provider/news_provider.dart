import 'package:flutter/material.dart';
import 'package:news_app/global/ui_state.dart';

class NewsProvider extends ChangeNotifier {
  BuildContext _context;

  init(BuildContext context) {
    _context = context;
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
