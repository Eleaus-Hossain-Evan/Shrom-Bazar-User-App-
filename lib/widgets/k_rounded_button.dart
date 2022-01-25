import 'package:flutter/material.dart';
import 'package:user_app/variables/config.dart';

class KRoundedButton extends StatelessWidget {
  const KRoundedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicSize(.1),
      height: dynamicSize(.1),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x3d000000),
      ),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: child,
      ),
    );
  }
}
