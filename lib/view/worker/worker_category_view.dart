import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/variables/config.dart';

class WorkerCategoryView extends StatelessWidget {
  String categoryName;
  int numberOfWorkers;
  WorkerCategoryView({Key? key, required this.categoryName, required this.numberOfWorkers}) : super(key: key);

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
                      categoryName,
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: dynamicSize(.05),
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: dynamicSize(0.02)),
                    Text(
                      '$numberOfWorkers workers found.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(.035),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(dynamicSize(0.02)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)
                ),
                child: Image.asset('assets/plumbing_icon.png', width: dynamicSize(0.07), height: dynamicSize(0.07)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
