import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/variables/config.dart';
import 'google_map_current_location.dart';
import 'longitude_latitude.dart';

class CarDetails extends StatefulWidget {
  CarDetails({Key? key, this.carCategory, this.amount}) : super(key: key);
  String? carCategory;
  String? amount;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.withOpacity(0.2),
        title: Text(widget.carCategory!),
        centerTitle: true,
      ),
      body: DetailsOfCars(
        amount: widget.amount,
      ),
    );
  }
}

class DetailsOfCars extends StatefulWidget {
  const DetailsOfCars({Key? key, this.amount}) : super(key: key);
  final String? amount;
  @override
  _DetailsOfCarsState createState() => _DetailsOfCarsState();
}

class _DetailsOfCarsState extends State<DetailsOfCars> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: dynamicSize(0.1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: dynamicSize(0.1),
                        ),
                        child: Text(
                          "Current Place",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: dynamicSize(0.05)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: dynamicSize(0.1),
                      ),
                      child: Text(
                        "Choice your Destination",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: dynamicSize(0.05)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dynamicSize(0.2),
                    width: dynamicSize(0.8),
                    child: const LongitudeLatitude(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            SizedBox(
              height: dynamicSize(0.1),
              width: dynamicSize(0.8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Amount = ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(0.05),
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      elevation: 0.5,
                      child: Row(
                        children: [
                          Text(
                            '৳',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: dynamicSize(.05),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: dynamicSize(0.025)),
                          Text(
                            '${widget.amount}/-',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: dynamicSize(.035),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    "",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.cyan.withOpacity(0.3),
                    messageText: Text(
                      "Booking Successful",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: dynamicSize(0.05)),
                    ),
                  );
                },
                child: Text(
                  "Booked  Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: dynamicSize(0.05)),
                ))
          ],
        ),
      ),
    );
  }
}
