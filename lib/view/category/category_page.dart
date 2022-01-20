import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';
import 'package:user_app/view/detail_page/detail_page.dart';

import 'widget/single_list_catagory_view.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage(
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
        actions: [
          GestureDetector(
            onTap: () => _showFilterDialog(context),
            child: Padding(
              padding: EdgeInsets.only(right: dynamicSize(.05)),
              child: const Icon(
                Icons.filter_list,
              ),
            ),
          ),
        ],
      ),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI() => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: numberOfWorkers,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.to(() => const DetailsPage()),
                child: SingleListCategoryView(categoryName: categoryName),
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
  RxInt isSelected = 0.obs;
  RxString date = "".obs;
  final textController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isSelected(0);
                    textController.clear();
                  },
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.all(dynamicSize(.025)),
                      decoration: BoxDecoration(
                        color: isSelected.value == 0
                            ? DataController.dc.getBGColor().withOpacity(.15)
                            : Colors.grey.withOpacity(.3),
                        border: Border.all(
                          color: isSelected.value == 0
                              ? DataController.dc.getBGColor()
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(dynamicSize(.02)),
                      ),
                      child: Text(
                        "Today",
                        style: Styles.titleTextStyle.copyWith(
                          fontSize: dynamicSize(.04),
                          color: isSelected.value == 0
                              ? DataController.dc.getBGColor()
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: dynamicSize(.05),
              ),
              // Expanded(
              //   child: GestureDetector(
              //     onTap: () {
              //       isSelected(1);
              //       textController.clear();
              //     },
              //     child: Obx(
              //       () => Container(
              //         padding: EdgeInsets.all(dynamicSize(.025)),
              //         decoration: BoxDecoration(
              //           color: isSelected.value == 1
              //               ? DataController.dc.getBGColor().withOpacity(.15)
              //               : Colors.grey.withOpacity(.3),
              //           border: Border.all(
              //             color: isSelected.value == 1
              //                 ? DataController.dc.getBGColor()
              //                 : Colors.grey,
              //           ),
              //           borderRadius: BorderRadius.circular(dynamicSize(.02)),
              //         ),
              //         child: Text(
              //           "Yesterday",
              //           style: Styles.titleTextStyle.copyWith(
              //             fontSize: dynamicSize(.04),
              //             color: isSelected.value == 1
              //                 ? DataController.dc.getBGColor()
              //                 : Colors.black54,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ExpanedTextButton(
                text: "Yesterday",
                isSelected: isSelected,
                onPressed: () {
                  isSelected(1);
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
                isSelected: isSelected,
                onPressed: () async => await _selectDate(context),
              ),
            ],
          ),
          Row(
            children: [],
          )
        ],
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
        isSelected(2);
      });
    }
  }
}

class ExpanedTextButton extends StatelessWidget {
  const ExpanedTextButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final RxInt isSelected;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          padding: EdgeInsets.all(dynamicSize(.025)),
          decoration: BoxDecoration(
            color: isSelected.value == 2
                ? DataController.dc.getBGColor().withOpacity(.15)
                : Colors.grey.withOpacity(.3),
            border: Border.all(
              color: isSelected.value == 2
                  ? DataController.dc.getBGColor()
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(dynamicSize(.02)),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.titleTextStyle.copyWith(
              fontSize: dynamicSize(.04),
              color: isSelected.value == 2
                  ? DataController.dc.getBGColor()
                  : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
