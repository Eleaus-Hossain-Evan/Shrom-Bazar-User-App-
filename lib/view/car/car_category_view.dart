import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/config.dart';

class CarCategoryView extends StatelessWidget {
  String carCategoryName;
  String numberOfSeat;
  String amount;
  String imageLink;
  CarCategoryView({Key? key, required this.carCategoryName, required this.numberOfSeat, required this.amount, required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.04), vertical: dynamicSize(0.02)),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dynamicSize(.03)),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(dynamicSize(.03))
          ),
          padding: EdgeInsets.all(dynamicSize(0.05)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carCategoryName,
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: dynamicSize(.05),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: dynamicSize(0.02)),
                    Row(
                      children: [
                        Icon(LineAwesomeIcons.user, color: Colors.black, size: dynamicSize(0.04),),
                        SizedBox(width: dynamicSize(0.02)),
                        Text(
                          '$numberOfSeat seat',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dynamicSize(.035),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: dynamicSize(0.02)),
                    Row(
                      children: [
                        Text(
                          '৳',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dynamicSize(.05),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(width: dynamicSize(0.025)),
                        Text(
                          '$amount/-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dynamicSize(.035),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(imageLink, width: dynamicSize(0.2), height: dynamicSize(0.2))
            ],
          ),
        ),
      ),
    );
  }
}
