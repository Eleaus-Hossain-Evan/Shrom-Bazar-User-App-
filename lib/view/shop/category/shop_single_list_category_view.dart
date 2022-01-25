import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';

class ShopSingleListCategoryView extends StatelessWidget {
  const ShopSingleListCategoryView({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width, //800
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dynamicSize(.045)),
        color: Colors.white,
        border: Border.all(
          color: DataController.dc.getBGColor().withOpacity(.3),
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: dynamicSize(.03),
        vertical: dynamicSize(.025),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dynamicSize(.043)),
              bottomLeft: Radius.circular(dynamicSize(.043)),
            ),
            child: Container(
              width: dynamicSize(.25),
              height: dynamicSize(.25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Clrs.themeColor,
                    DataController.dc.getBGColor().withOpacity(.5),
                  ],
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(),
                child: Image.asset(
                  "assets/work-space1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: dynamicSize(.04)),
          Container(
            width: dynamicSize(.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\u2316 Uttora",
                  style: Styles.titleTextStyle.copyWith(
                    color: DataController.dc.getBGColor(),
                  ),
                ),
                SizedBox(height: dynamicSize(.01)),
                RichText(
                  text: TextSpan(
                      text: categoryName,
                      style: Styles.subTitleTextStyle,
                      children: [
                        // TextSpan(
                        //   text: " \u00B7 ",
                        //   style: TextStyle(
                        //     fontSize: dynamicSize(.05),
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        TextSpan(
                          text: "  \u00B7  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "2000sqft",
                          style: Styles.subTitleTextStyle,
                        ),
                      ]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: DataController.dc.getBGColor().withOpacity(.5),
                      size: dynamicSize(.04),
                    ),
                    SizedBox(
                      width: dynamicSize(.015),
                    ),
                    Text(
                      "Available Now",
                      style: Styles.subTitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Row(
            children: [
              Icon(
                Icons.monetization_on,
                color: DataController.dc.getBGColor().withOpacity(.5),
              ),
              const Text(
                "20000\u09F3",
                style: TextStyle(
                  color: Color(0xFF636B79),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
