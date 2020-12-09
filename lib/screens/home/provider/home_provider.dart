import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/global/resources/icons.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext _context;

  init(BuildContext context, TabController controller) {
    _context = context;
    _setTabController(controller);
  }

  // ******************* Tab controller ***************************

  TabController _tabController;
  TabController get tabController => _tabController;
  void _setTabController(TabController controller) {
    _tabController = controller..addListener(() => notifyListeners());
  }

  int get _selectedTabIndex => tabController?.index;

  String get trendingIcon =>
      _selectedTabIndex == 0 ? KTrendingSolidIcon : KTrendingIcon;

  String get exploreIcon =>
      _selectedTabIndex == 1 ? KExploreSolidIcon : KExploreIcon;

  void disposeTabController() {
    _tabController.dispose();
  }
}
