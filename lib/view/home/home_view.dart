import 'package:flutter/material.dart';
import 'package:user_app/variables/config.dart';

class HomeRentView extends StatelessWidget {
  String title;
  List<String> imageList;
  String location;
  String size;
  HomeRentView({Key? key, required this.title, required this.location, required this.size, required this.imageList}) : super(key: key);

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
                      title,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: dynamicSize(.04),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: dynamicSize(0.04)),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.black, size: dynamicSize(0.04),),
                        SizedBox(width: dynamicSize(0.02)),
                        Text(
                          location,
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
                        Icon(Icons.info_outline, color: Colors.black, size: dynamicSize(0.04),),
                        SizedBox(width: dynamicSize(0.025)),
                        Text(
                          '$size square feet',
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
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1)
                        ),
                          child: Image.asset(imageList[0], height: dynamicSize(.12), width: dynamicSize(0.12),)),
                      SizedBox(width: dynamicSize(0.01),),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)
                          ),child: Image.asset(imageList[1], height: dynamicSize(.12), width: dynamicSize(0.12),)),
                    ],
                  ),
                  SizedBox(height: dynamicSize(.01),),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)
                          ),child: Image.asset(imageList[2], height: dynamicSize(.12), width: dynamicSize(0.12),)),
                      SizedBox(width: dynamicSize(0.01),),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)
                          ),child: Image.asset(imageList[3], height: dynamicSize(.12), width: dynamicSize(0.12),)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
