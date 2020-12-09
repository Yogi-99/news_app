import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../global/resources/colors.dart';
import '../../global/resources/icons.dart';
import '../../global/size_config.dart';

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
          body: _tabBarView(homeProvider),
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar(
    bool innerBoxIsScrolled,
    HomeProvider homeProvider,
  ) =>
      SliverAppBar(
        title: Text(
          'News App',
          style: _textTheme.headline5,
        ),
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

  _tabBarView(HomeProvider homeProvider) => TabBarView(
        controller: homeProvider.tabController,
        children: [
          Placeholder(),
          Placeholder(),
        ],
      );
}
