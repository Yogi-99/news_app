import 'package:flutter/material.dart';

import 'global/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig.init(constraints, orientation);
          return MaterialApp(
            title: 'Material App',
            home: Scaffold(
              appBar: AppBar(
                title: Text('Material App Bar'),
              ),
              body: Center(
                child: Container(
                  child: Text('Hello World'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
