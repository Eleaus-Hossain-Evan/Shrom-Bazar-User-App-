import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config.dart';

class Styles {
  static TextStyle titleTextStyle =
      Theme.of(Get.context!).textTheme.headline6!.copyWith(
            color: Colors.teal,
          );
  static TextStyle subTitleTextStyle =
      Theme.of(Get.context!).textTheme.headline4!.copyWith(
            fontSize: dynamicSize(.035),
          );
}
