import 'package:flutter/material.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClick;

  const ButtonWidget({
    Key key,
    @required this.onClick,
  })  : assert(onClick != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onClick,
      child: Text(
        'Read full article',
        style: Theme.of(context).textTheme.button,
      ),
      color: KBlackColor,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.textMultiplier * 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
