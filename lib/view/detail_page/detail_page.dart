import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  final RxBool isRequest = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("Details"),
      ),
      body: bodyUI(),
    );
  }

  Widget bodyUI() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dynamicSize(.05)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 40,
                child: SizedBox(
                  height: dynamicSize(.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      dynamicSize(.05),
                    ),
                    child: Image.asset(
                      'assets/worker-person.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: dynamicSize(.05),
              ),
              Expanded(
                flex: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mr. John Dao',
                      textAlign: TextAlign.start,
                      style: Styles.titleTextStyle.copyWith(
                        color: DataController.dc.getBGColor(),
                      ),
                    ),
                    SizedBox(height: dynamicSize(.02)),
                    Text(
                      categoryName,
                      textAlign: TextAlign.start,
                      style: Styles.subTitleTextStyle,
                    ),
                    SizedBox(height: dynamicSize(.15)),
                    Row(
                      children: [
                        KIconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {},
                          backgroundColor: Colors.blueGrey.shade200,
                        ),
                        SizedBox(
                          width: dynamicSize(.05),
                        ),
                        KIconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {},
                          backgroundColor:
                              DataController.dc.getBGColor().withOpacity(.4),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: dynamicSize(.1),
          ),
          Text(
            "About",
            textAlign: TextAlign.start,
            style: Styles.titleTextStyle.copyWith(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: dynamicSize(.04),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac lacus fermentum, varius justo vel, blandit dui. Proin ac augue.",
            textAlign: TextAlign.start,
            style: Styles.bodyTextStyle,
          ),
          SizedBox(
            height: dynamicSize(.1),
          ),
          Row(
            children: [
              Text("Availability:"),
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
              Text("Location:"),
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
            height: dynamicSize(.02),
          ),
          Row(
            children: [
              Text("Price:"),
              SizedBox(
                width: dynamicSize(.01),
              ),
              Icon(
                LineAwesomeIcons.comment_dollar,
                color: DataController.dc.getBGColor(),
                size: dynamicSize(.05),
              ),
              SizedBox(
                width: dynamicSize(.01),
              ),
              Text(
                "1200",
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
            height: dynamicSize(.1),
          ),
          Row(
            children: [
              Obx(
                () => KIconButton(
                  icon: Text(
                    isRequest.isTrue ? "Request Pending" : "Request Booking",
                    textAlign: TextAlign.center,
                    style: Styles.titleTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: dynamicSize(.04),
                    ),
                  ),
                  onPressed: () {
                    isRequest(!isRequest.value);
                  },
                  backgroundColor: isRequest.isTrue
                      ? Colors.deepOrangeAccent.shade200
                      : DataController.dc.getBGColor(),
                ),
              ),
            ],
          ),
        ],
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
