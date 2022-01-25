import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/config.dart';

class FilterShopPage extends StatefulWidget {
  @override
  _FilterShopPageState createState() => _FilterShopPageState();
}

class _FilterShopPageState extends State<FilterShopPage> {
  String _selectedMonth = 'January';
  String _selectedMaxPrice = 'Max price range';
  String _selectedMinPrice = 'Min price range';
  final List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<String> maxPriceList = [
    'Any',
    '10000',
    '20000',
    '30000',
    '40000',
    '50000',
    '60000',
    '70000',
    '80000',
    '90000',
    '100000'
  ];

  final List<String> minPriceList = [
    'Any',
    '1000',
    '3000',
    '5000',
    '10000',
    '20000',
    '30000',
    '40000',
    '50000'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0), child: _appBar()),
        body: _bodyUI(),
      ),
    );
  }

  /// custom app bar
  Widget _appBar() => Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.02)),
        width: Get.width,
        height: AppBar().preferredSize.height,
        color: DataController.dc.getBGColor().withOpacity(0.2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close,
                    color: Colors.black, size: dynamicSize(0.08)),
              ),
            ),
            Text(
              'Filter Property',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: dynamicSize(.05),
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

  /// body
  Widget _bodyUI() => Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(dynamicSize(.04)),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.black),
                    SizedBox(
                      width: dynamicSize(.02),
                    ),
                    Text(
                      'Property Location',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(.04),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: dynamicSize(.04)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dynamicSize(.02)),
                            border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.symmetric(
                            horizontal: dynamicSize(.02),
                            vertical: dynamicSize(.02)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Select District',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: dynamicSize(.04),
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: dynamicSize(.02)),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dynamicSize(.02)),
                            border: Border.all(color: Colors.black)),
                        padding: EdgeInsets.symmetric(
                            horizontal: dynamicSize(.02),
                            vertical: dynamicSize(.02)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Select Area',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: dynamicSize(.04),
                                  fontWeight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: dynamicSize(.08)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, color: Colors.black),
                    SizedBox(
                      width: dynamicSize(.02),
                    ),
                    Text(
                      'Available From',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(.04),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: dynamicSize(.04),
                ),
                Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(dynamicSize(.02)),
                      border: Border.all(color: Colors.black)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(dynamicSize(.02)),
                    child: FindDropdown(
                      items: monthList,
                      onChanged: (String? item) => print(item),
                      selectedItem: _selectedMonth,
                    ),
                  ),
                ),
                SizedBox(height: dynamicSize(.08)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.price_change_outlined, color: Colors.black),
                    SizedBox(
                      width: dynamicSize(.02),
                    ),
                    Text(
                      'Price Range',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: dynamicSize(.04),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: dynamicSize(.04)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(dynamicSize(.02)),
                            border: Border.all(color: Colors.black)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(dynamicSize(.02)),
                          child: FindDropdown(
                            items: maxPriceList,
                            onChanged: (String? item) => print(item),
                            selectedItem: _selectedMaxPrice,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: dynamicSize(.02)),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(dynamicSize(.02)),
                            border: Border.all(color: Colors.black)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(dynamicSize(.02)),
                          child: FindDropdown(
                            items: minPriceList,
                            onChanged: (String? item) => print(item),
                            selectedItem: _selectedMinPrice,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: dynamicSize(.08)),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(dynamicSize(.01)),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(
                          vertical: dynamicSize(.027),
                          horizontal: dynamicSize(.06)),
                      child: Text(
                        'RESET',
                        style: TextStyle(
                            color: Colors.black, fontSize: dynamicSize(.04)),
                      )),
                  SizedBox(width: dynamicSize(.02)),
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: DataController.dc.getBGColor().withOpacity(.2),
                          borderRadius: BorderRadius.circular(dynamicSize(.01)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: dynamicSize(.03),
                            horizontal: dynamicSize(.06)),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            'SEARCH',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: dynamicSize(.04)),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
