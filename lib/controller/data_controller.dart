import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  static DataController dc = Get.find();

  RxDouble size = 0.0.obs;
  RxBool isPhone=true.obs;

  void getSize(BuildContext context){
    // Mobile (Smartphone) max-width: 480px
    // Low Resolution Tablets and ipads max-width: 767px
    // Tablets Ipads portrait mode max-width:1024px
    // Desktops max-width:1280px
    // Huge size (Larger screen) max-width: 1281px and greater
    Size s = MediaQuery.of(context).size; //MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
    if(s.width<=500){
      size(s.width);
    }else if(s.width>500){
      size(s.height);
    }
    update();
    if (kDebugMode) {
      print('Size: w=${s.width}, h=${s.height}');
    }

  }

  bool isMobile(){
    final Size s = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
    if(s.width<=500){
      isPhone(true);
      update();
      return true;
    }else if(s.width>500){
      isPhone(false);
      update();
      return false;
    }else {
      isPhone(true);
      update();
      return true;
    }
  }
}