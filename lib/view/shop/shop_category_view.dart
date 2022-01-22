import 'package:flutter/material.dart';
import 'package:user_app/variables/config.dart';

class ShopCategoryView extends StatelessWidget {
  String shopRentCategory;
  String numberOfLocation;

  ShopCategoryView({Key? key, required this.shopRentCategory, required this.numberOfLocation}) : super(key: key);
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
                      shopRentCategory,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: dynamicSize(.05),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: dynamicSize(0.02)),
                    Text(
                      '$numberOfLocation locations found',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(.035),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
