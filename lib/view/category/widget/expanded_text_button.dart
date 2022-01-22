import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controller/data_controller.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/variables/style.dart';

class ExpanedTextButton extends StatelessWidget {
  ExpanedTextButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.backgroundColor = false,
  }) : super(key: key);

  final RxBool isSelected;
  final VoidCallback onPressed;
  final String text;
  final bool backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          padding: EdgeInsets.all(dynamicSize(.025)),
          decoration: BoxDecoration(
            color: isSelected.value
                ? backgroundColor
                    ? Colors.green.shade200
                    : DataController.dc.getBGColor().withOpacity(.15)
                : Colors.grey.withOpacity(.3),
            border: Border.all(
              color: isSelected.value
                  ? backgroundColor
                      ? Colors.green
                      : DataController.dc.getBGColor()
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(dynamicSize(.02)),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.titleTextStyle.copyWith(
              fontSize: dynamicSize(.04),
              color: isSelected.value
                  ? backgroundColor
                      ? Colors.white70
                      : DataController.dc.getBGColor()
                  : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
