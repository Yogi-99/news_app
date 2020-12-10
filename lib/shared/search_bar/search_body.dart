import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';

class SearchBarBody extends StatelessWidget {
  final Widget child;

  const SearchBarBody({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.textMultiplier),
      height: kToolbarHeight * .9,
      decoration: BoxDecoration(
        color: KGreyColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
