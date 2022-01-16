import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/model/home_menu_model.dart';

class Variables{
  static var systemOverlay = SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark));

  static var portraitMood =SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  static var landscapeMood =SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

  static final theme = ThemeData(
    backgroundColor:  Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.teal,
    canvasColor: Colors.transparent,
    // fontFamily: 'ubuntu',
    //textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.redAccent),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0.0,
    //     showSelectedLabels: true,
    //     showUnselectedLabels: true,
    //     unselectedItemColor: Colors.white,
    //     selectedItemColor: orangeThemeColor
    // )
  );

  static void mainConfig(){
    //DataController c = Get.put(DataController());
    final bool isMobile = DataController.dc.isMobile();
    if(isMobile){
      Variables.portraitMood;
      print('phone');
    }else{Variables.landscapeMood;print('Tab');}
  }

  static const List<String> imageList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  static final List<HomeMenuModel> homeMenuDataList=[
    HomeMenuModel(icon: LineAwesomeIcons.tools,title: 'Worker', bgColor: Colors.teal),
    HomeMenuModel(icon: LineAwesomeIcons.alternate_store,title: 'Shop', bgColor: Colors.green),
    HomeMenuModel(icon: LineAwesomeIcons.taxi,title: 'Car', bgColor: Colors.cyan),
    HomeMenuModel(icon: LineAwesomeIcons.home,title: 'Home', bgColor: Colors.deepPurple)
  ];
}