import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? bgColor;

  const SolidButton(
      {Key? key,required this.child,
      required this.onPressed,
      this.borderRadius,
      this.height,
      this.width,
      this.bgColor}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: bgColor??Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius??5.0)),
        child: InkWell(
            onTap: onPressed,
            splashColor: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??5.0)),
            child: Container(
              height: height??40.0,
              width: width??100.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: child,
            )
        )
    );
  }
}
