import 'package:flutter/material.dart';
import '../resources/app_color.dart';
class ButtonCustom extends StatelessWidget {
  final VoidCallback? onPress;
  final double? width;
  final double height;
  final Color borderColor;
  final double radius;
  final Color backgroundColor;
  final String text;
  final Color? textColor;
  const ButtonCustom({
    super.key,
    required this.onPress,
    this.width = 150.0,
    this.height = 40,
    this.borderColor = AppColor.blue,
    this.radius = 5.0,
    this.backgroundColor = AppColor.grey,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(0.0, 2.0),
                blurRadius: 4.0,
              )
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}