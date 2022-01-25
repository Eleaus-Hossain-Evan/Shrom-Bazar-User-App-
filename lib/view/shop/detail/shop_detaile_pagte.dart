import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';
import 'package:user_app/widgets/k_rounded_button.dart';

class ShopDetailsPage extends StatelessWidget {
  ShopDetailsPage({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  final RxBool isRequest = false.obs;

  RxInt imageNum = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyUI(),
    );
  }

  Widget bodyUI() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: dynamicSize(.05)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: dynamicSize(.05)),
                  width: Get.width,
                  height: dynamicSize(.8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      dynamicSize(.05),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/work-space${imageNum.value}.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(dynamicSize(.05)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KRoundedButton(
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Get.back(),
                            ),
                            KRoundedButton(
                              child: const Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: dynamicSize(.9),
                        color: const Color(0x83000000),
                        margin:
                            EdgeInsets.symmetric(vertical: dynamicSize(.04)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              3,
                              (index) => GestureDetector(
                                onTap: () => imageNum(index + 1),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: dynamicSize(.025),
                                      vertical: dynamicSize(.01)),
                                  width: dynamicSize(.08),
                                  height: dynamicSize(.1),
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(
                                    //   dynamicSize(.05),
                                    // ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/work-space${index + 1}.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Description",
                  textAlign: TextAlign.start,
                  style: Styles.titleTextStyle.copyWith(
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: dynamicSize(.04),
                ),
                RichText(
                  text: TextSpan(
                      text:
                          "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... ",
                      style: Styles.bodyTextStyle,
                      children: [
                        TextSpan(
                          text: "Show More",
                          style: Styles.bodyTextStyle.copyWith(
                            color: DataController.dc.getBGColor(),
                          ),
                        ),
                      ]),
                ),
                // Text(
                //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac lacus fermentum, varius justo vel, blandit dui. Proin ac augue.",
                //   textAlign: TextAlign.start,
                //   style: Styles.bodyTextStyle,
                // ),
                SizedBox(
                  height: dynamicSize(.1),
                ),
                Row(
                  children: [
                    Container(
                      width: dynamicSize(.119),
                      height: dynamicSize(.119),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/work-space${imageNum.value}.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: dynamicSize(.03)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Garry Allen", style: Styles.titleTextStyle),
                          Text(
                            "Author",
                            style: Styles.subTitleTextStyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(dynamicSize(.016)),
                      child: KIconButton(
                        icon: Icon(
                          Icons.chat,
                          size: dynamicSize(.04),
                        ),
                        onPressed: () {},
                        backgroundColor: Colors.blueGrey.shade200,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(dynamicSize(.016)),
                      child: KIconButton(
                        icon: Icon(
                          Icons.call,
                          size: dynamicSize(.04),
                        ),
                        onPressed: () {},
                        backgroundColor:
                            DataController.dc.getBGColor().withOpacity(.4),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: dynamicSize(.1),
                ),
                Row(
                  children: [
                    const Text("Availability:"),
                    SizedBox(
                      width: dynamicSize(.01),
                    ),
                    Icon(
                      Icons.av_timer,
                      color: DataController.dc.getBGColor(),
                      size: dynamicSize(.04),
                    ),
                    SizedBox(
                      width: dynamicSize(.015),
                    ),
                    Text(
                      "Available Now",
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      softWrap: true,
                      style: Styles.subTitleTextStyle.copyWith(
                        color: DataController.dc.getBGColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(.02),
                ),
                Row(
                  children: [
                    const Text("Location:"),
                    SizedBox(
                      width: dynamicSize(.01),
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: DataController.dc.getBGColor(),
                      size: dynamicSize(.05),
                    ),
                    SizedBox(
                      width: dynamicSize(.015),
                    ),
                    Text(
                      "Uttora",
                      maxLines: 2,
                      softWrap: true,
                      style: Styles.subTitleTextStyle.copyWith(
                        color: DataController.dc.getBGColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: DataController.dc.categoryName.value == "Shop"
                      ? dynamicSize(.02)
                      : 0,
                ),
                DataController.dc.categoryName.value == "Shop"
                    ? Row(
                        children: [
                          const Text("Space:"),
                          SizedBox(
                            width: dynamicSize(.01),
                          ),
                          Text(
                            "\u23CD",
                            style: TextStyle(
                              color: DataController.dc.getBGColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: dynamicSize(.01),
                          ),
                          Text(
                            "2000 SQFT",
                            maxLines: 2,
                            softWrap: true,
                            style: Styles.subTitleTextStyle.copyWith(
                              color: DataController.dc.getBGColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: dynamicSize(.1),
                ),
                Obx(
                  () => Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price:",
                            style: Styles.bodyTextStyle.copyWith(
                              color: DataController.dc.getBGColor(),
                            ),
                          ),
                          Text(
                            "\u09F3 20000 / month",
                            style: Styles.titleTextStyle.copyWith(
                                color: Colors.black54,
                                fontSize: dynamicSize(.045)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: dynamicSize(.05),
                      ),
                      KIconButton(
                        icon: Text(
                          isRequest.isTrue
                              ? "Request Pending"
                              : "Request Booking",
                          textAlign: TextAlign.center,
                          style: Styles.titleTextStyle.copyWith(
                            color: Colors.black54,
                            fontSize: dynamicSize(.04),
                          ),
                        ),
                        onPressed: () {
                          isRequest(!isRequest.value);
                        },
                        backgroundColor: isRequest.isTrue
                            ? Colors.deepOrangeAccent.shade200.withOpacity(.4)
                            : DataController.dc.getBGColor().withOpacity(.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KIconButton extends StatelessWidget {
  KIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          padding: EdgeInsets.all(dynamicSize(.025)),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: backgroundColor,
            ),
            borderRadius: BorderRadius.circular(dynamicSize(.02)),
          ),
          child: icon,
        ),
      ),
    );
  }
}
