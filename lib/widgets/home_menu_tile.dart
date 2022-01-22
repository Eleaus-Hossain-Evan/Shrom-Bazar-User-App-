import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/model/home_menu_model.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/view/car/car_page.dart';
import 'package:user_app/view/home/home_rent_page.dart';
import 'package:user_app/view/shop/shop_page.dart';
import '../view/worker/worker_page.dart';

class HomeMenuTile extends StatelessWidget {
  const HomeMenuTile({Key? key,required this.menuModel}) : super(key: key);
  final HomeMenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: menuModel.bgColor.withOpacity(.2),
      borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.02))),
      child: InkWell(
        onTap: (){
          if(menuModel.title == 'Worker'){
            Get.to(() => const WorkerPage());
          }
          if(menuModel.title == 'Car'){
            Get.to(() => const CarPage());
          }
          if(menuModel.title == 'Home'){
            Get.to(() => const HomeRentPage());
          }
          if(menuModel.title == 'Shop'){
            Get.to(() => const ShopPage());
          }
        },
        borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.02))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(menuModel.icon,color: menuModel.bgColor,size: dynamicSize(.15)),
            Text(menuModel.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Clrs.textColor,fontSize: dynamicSize(.05),fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
