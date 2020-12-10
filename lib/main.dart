import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:provider/provider.dart';

import 'global/route_generator.dart';
import 'global/size_config.dart';
import 'global/theme/app_bar_theme.dart';
import 'global/theme/text_theme.dart';
import 'provider/article_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/provider/home_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig.init(constraints, orientation);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<HomeProvider>(
                create: (context) => HomeProvider(),
              ),
              ChangeNotifierProvider<ArticleProvider>(
                create: (context) => ArticleProvider(),
              ),
            ],
            child: MaterialApp(
              title: 'News App',
              theme: ThemeData.light().copyWith(
                textTheme: kTextTheme,
                appBarTheme: KAppBarTheme,
                scaffoldBackgroundColor: KWhiteColor,
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: HomeScreen.id,
            ),
          );
        },
      ),
    );
  }
}
