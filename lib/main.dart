import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/static_variables.dart';
import 'package:user_app/view/splash_screen.dart';
import 'controller/data_controller.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Variables.portraitMood;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    final DataController c = Get.put(DataController());
    //Variables.mainConfig();
    return GetMaterialApp(
      title: 'Shrom Bazar',
      debugShowCheckedModeBanner: false,
      theme: Variables.theme,
      home: const SplashScreen(),
    );
    /// test comment
  }
}
