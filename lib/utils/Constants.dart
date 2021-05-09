import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_petkon/utils/size_config.dart';


getWidthToHeightRatio(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  debugPrint("SCREEN_HEIGHT--> ${screenHeight}");
  var ratio = (getProportionateScreenWidth(context, space_230) /
      (Platform.isIOS
          ? getProportionateScreenHeight(context, space_300)
          : screenHeight <= 712
          ? getProportionateScreenHeight(context, space_230)
          : getProportionateScreenHeight(context, space_230)));
  return ratio;
}


getProductsWidthToHeightRatio(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  debugPrint("SCREEN_HEIGHT--> ${screenHeight}");
  var ratio = (getProportionateScreenWidth(context, space_230) /
      (Platform.isIOS
          ? getProportionateScreenHeight(context, space_300)
          : screenHeight <= 712
          ? getProportionateScreenHeight(context, space_370)
          : getProportionateScreenHeight(context, space_320)));
  return ratio;
}

void showSnakbar(GlobalKey<ScaffoldState> _scaffoldKey, String msg) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(msg),
  ));
}



