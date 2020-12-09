import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/route_generator.dart';
import 'package:news_app/global/theme/app_bar_theme.dart';
import 'package:news_app/global/theme/text_theme.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/home/home_screen.dart';
import 'package:news_app/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'global/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig.init(constraints, orientation);
          return ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
            child: MaterialApp(
              title: 'News App',
              theme: ThemeData.light()
                  .copyWith(textTheme: kTextTheme, appBarTheme: KAppBarTheme),
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
