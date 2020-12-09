import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/global/resources/colors.dart';
import 'package:news_app/global/size_config.dart';

class ShowMessage {
  static show(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: SizeConfig.sixteen,
      textColor: KBlackColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
