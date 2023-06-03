import 'package:flutter/material.dart';
import '../resources/app_color.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final double? height;
  final Color textFieldBorderColor;
  final double radius;
  final Color backgroundColor;
  final bool isPassWord;
  final Color cursorColor;
  final String? hintText;
  final Color? hintTextColor;
  final Icon? icon;
  final Color? iconColor;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const TextFieldCustom({
    super.key,
    required this.controller,
    this.width,
    this.height = 50.0,
    this.textFieldBorderColor = AppColor.grey,
    this.radius = 12.0,
    this.backgroundColor = AppColor.white,
    this.isPassWord = false,
    this.cursorColor = AppColor.black,
    this.hintText,
    this.hintTextColor,
    this.icon,
    this.iconColor,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: textFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: isPassWord,
          cursorColor: cursorColor,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: hintTextColor),
              icon: icon,
              iconColor: iconColor,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
