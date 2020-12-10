import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/global/ui_state.dart';
import 'package:news_app/shared/loader/show_progress_utility.dart';
import 'package:news_app/shared/no_article_available.dart';
import 'package:provider/provider.dart';

import '../../global/resources/colors.dart';
import '../../global/size_config.dart';
import '../../model/article.dart';
import '../../provider/article_provider.dart';
import '../../shared/article_tile.dart';
import '../../shared/search_bar/search_bar.dart';
import 'provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextTheme _textTheme;

  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false)
        .init(context, TabController(length: 2, vsync: this));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ArticleProvider>(context, listen: false).init();
    });
  }

  @override
  void dispose() {
    Provider.of<HomeProvider>(context, listen: false).disposeTabController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;

    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [_sliverAppBar(innerBoxIsScrolled, homeProvider)],
          body: Stack(
            children: [
              _tabBarView(homeProvider),
              ShowProgressUtility.showProgressBar(
                Provider.of<ArticleProvider>(context).uiState ==
                    UiState.loading,
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar(
    bool innerBoxIsScrolled,
    HomeProvider homeProvider,
  ) =>
      SliverAppBar(
        title: SearchBar(
          showDropdown: homeProvider.showDropdownInAppBar,
        ),
        actions: [],
        pinned: true,
        floating: true,
        snap: true,
        forceElevated: innerBoxIsScrolled,
        elevation: 0.0,
        bottom: _tabBar(homeProvider),
      );

  TabBar _tabBar(HomeProvider homeProvider) => TabBar(
        controller: homeProvider.tabController,
        labelStyle: _textTheme.bodyText1.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: _textTheme.bodyText1,
        labelColor: KBlackColor,
        indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
        tabs: [
          Tab(
            icon: SvgPicture.asset(
              homeProvider.trendingIcon,
              height: SizeConfig.textMultiplier * 4,
            ),
            text: 'Top Headlines',
          ),
          Tab(
            icon: SvgPicture.asset(
              homeProvider.exploreIcon,
              height: SizeConfig.textMultiplier * 4,
            ),
            text: 'Explore',
          ),
        ],
      );

  _tabBarView(HomeProvider homeProvider) => Consumer<ArticleProvider>(
        builder: (context, articleProvider, child) => TabBarView(
          controller: homeProvider.tabController,
          children: [
            _topHeadlines(articleProvider),
            _explore(articleProvider),
          ],
        ),
      );

  _topHeadlines(ArticleProvider articleProvider) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
        child: articleProvider.noArticleInTopHeadings
            ? NoArticleAvailable()
            : ListView.builder(
                itemCount: articleProvider.topHeadlineArticles.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Article _article = articleProvider.topHeadlineArticles[index];
                  return ArticleTile(article: _article);
                },
              ),
      );

  _explore(ArticleProvider articleProvider) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2),
        child: articleProvider.noArticlesInExplore
            ? NoArticleAvailable()
            : ListView.builder(
                itemCount: articleProvider.exploreArticles.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Article _article = articleProvider.exploreArticles[index];
                  return ArticleTile(article: _article);
                },
              ),
      );
}
