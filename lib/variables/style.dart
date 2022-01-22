import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/data_controller.dart';

import 'config.dart';

class Styles {
  static TextStyle titleTextStyle =
      Theme.of(Get.context!).textTheme.headline6!.copyWith(
            color: DataController.dc.getBGColor(),
          );
  static TextStyle subTitleTextStyle =
      Theme.of(Get.context!).textTheme.headline4!.copyWith(
            fontSize: dynamicSize(.035),
          );
  static TextStyle bodyTextStyle =
      Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
            fontSize: dynamicSize(.035),
          );
}
