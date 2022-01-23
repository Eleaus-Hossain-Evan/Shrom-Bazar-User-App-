import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';

class WorkerHistoryPreview extends StatelessWidget {
  String workerName;
  String workerImage;
  String workerCategoryName;
  String workingDuration;
  String date;
  String amount;

  WorkerHistoryPreview(
      {Key? key,
      required this.workerName,
      required this.workerImage,
      required this.workerCategoryName,
      required this.workingDuration,
      required this.date,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicSize(0.02), vertical: dynamicSize(0.02)),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dynamicSize(.03)),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(dynamicSize(.03))),
          padding: EdgeInsets.all(dynamicSize(0.05)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(workerImage),
                backgroundColor: Clrs.themeColor.withOpacity(0.1),
                radius: dynamicSize(.05),
              ),
              SizedBox(width: dynamicSize(.03)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workerName,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: dynamicSize(.045),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    workerCategoryName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: dynamicSize(.035),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: dynamicSize(0.02),
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: dynamicSize(0.05),
                          height: dynamicSize(0.05),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: dynamicSize(0.05),
                          )),
                      SizedBox(
                        width: dynamicSize(0.02),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: dynamicSize(.035),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dynamicSize(0.01),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: dynamicSize(0.05),
                        height: dynamicSize(0.05),
                        child: Icon(
                          Icons.alarm_on,
                          color: Colors.grey,
                          size: dynamicSize(0.05),
                        ),
                      ),
                      SizedBox(
                        width: dynamicSize(0.02),
                      ),
                      Text(
                        workingDuration,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: dynamicSize(.035),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: dynamicSize(0.05),
                        height: dynamicSize(0.05),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          '৳',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: dynamicSize(.035),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: dynamicSize(0.02),
                      ),
                      Text(
                        '$amount /-',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: dynamicSize(.035),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
