import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';
import 'package:user_app/view/category/widget/expanded_text_button.dart';
import 'package:user_app/view/detail_page/detail_page.dart';
import 'package:user_app/view/shop/category/shop_single_list_category_view.dart';
import 'package:user_app/view/shop/detail/shop_detaile_pagte.dart';
import 'package:user_app/view/shop/filter_shop.dart';

class ShopCategoryPage extends StatelessWidget {
  ShopCategoryPage(
      {Key? key, required this.categoryName, required this.numberOfWorkers})
      : super(key: key);

  String categoryName;
  int numberOfWorkers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DataController.dc.getBGColor().withOpacity(.2),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(categoryName),
      ),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dynamicSize(.04),
              vertical: dynamicSize(.02),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$numberOfWorkers properties found",
                  style: Styles.titleTextStyle.copyWith(
                    color: Colors.black54,
                    fontSize: dynamicSize(.05),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => FilterShopPage()),
                  child: Padding(
                    padding: EdgeInsets.only(right: dynamicSize(.05)),
                    child: const Icon(
                      Icons.filter_list,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: numberOfWorkers,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () =>
                    Get.to(() => ShopDetailsPage(categoryName: categoryName)),
                child: ShopSingleListCategoryView(categoryName: categoryName),
              );
            },
          ),
        ],
      );

  _showFilterDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return const FilterBottomSheetWidget();
        });
  }
}

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterBottomSheetWidget> createState() =>
      _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  RxInt isDaySelected = 0.obs;
  RxInt isTimeSelected = 0.obs;
  RxString date = "".obs;
  final textController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicSize(.7),
      width: Get.width,
      padding: EdgeInsets.only(
        top: dynamicSize(.05),
        right: dynamicSize(.05),
        left: dynamicSize(.05),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dynamicSize(.05)),
          topRight: Radius.circular(dynamicSize(.05)),
        ),
      ),
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ExpanedTextButton(
                    text: "Today",
                    isSelected: (isDaySelected.value == 0).obs,
                    onPressed: () {
                      isDaySelected(0);
                      textController.clear();
                    }),
                SizedBox(
                  width: dynamicSize(.05),
                ),
                ExpanedTextButton(
                  text: "Yesterday",
                  isSelected: (isDaySelected.value == 1).obs,
                  onPressed: () {
                    isDaySelected(1);
                    textController.clear();
                  },
                ),
              ],
            ),
            SizedBox(
              height: dynamicSize(.02),
            ),
            Row(
              children: [
                Obx(
                  () => Expanded(
                    child: TextField(
                      controller: textController,
                      textAlign: TextAlign.center,
                      style: Styles.titleTextStyle.copyWith(
                        fontSize: dynamicSize(.04),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: dynamicSize(.05),
                ),
                ExpanedTextButton(
                  text: "Select Date",
                  isSelected: (isDaySelected.value == 3).obs,
                  onPressed: () async => await _selectDate(context),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: dynamicSize(.025)),
              child: Divider(
                color: DataController.dc.getBGColor(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: dynamicSize(.05)),
              child: Row(
                children: [
                  ExpanedTextButton(
                    text: "Morning",
                    isSelected: (isTimeSelected.value == 0).obs,
                    onPressed: () {
                      isTimeSelected(0);
                    },
                  ),
                  SizedBox(
                    width: dynamicSize(.05),
                  ),
                  ExpanedTextButton(
                    text: "Afternone",
                    isSelected: (isTimeSelected.value == 1).obs,
                    onPressed: () {
                      isTimeSelected(1);
                    },
                  ),
                  SizedBox(
                    width: dynamicSize(.05),
                  ),
                  ExpanedTextButton(
                    text: "Evening",
                    isSelected: (isTimeSelected.value == 2).obs,
                    onPressed: () {
                      isTimeSelected(2);
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ExpanedTextButton(
                  text: "Apply",
                  isSelected: true.obs,
                  backgroundColor: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        date.value = DateFormat.yMd().format(selectedDate);
        textController.text = DateFormat.yMd().format(selectedDate);
        isDaySelected(2);
      });
    }
  }
}
