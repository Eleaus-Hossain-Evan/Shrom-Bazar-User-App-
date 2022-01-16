import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //final DataController controller = Get.find();
    //controller.getSize(context);
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(()=>const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController) {
        dataController.getSize(context);
        return const Scaffold(
          body: Center(child: Text('Splash Screen')),
        );
      }
    );
  }
}
