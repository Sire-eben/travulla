import 'package:flutter/material.dart';
import 'package:travulla/misc/colors.dart';
import 'package:travulla/widgets/large_text.dart';
import 'package:travulla/widgets/small_texts.dart';

class AppButtons extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor, borderColor;
  double? size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons(
      {super.key,
      this.isIcon = false,
      this.text = 'Hi',
      this.icon,
      this.color,
      this.backgroundColor,
      this.borderColor,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 60,
      height: size ?? 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor ?? Colors.white,
          border: Border.all(color: borderColor ?? AppColors.textColor1)),
      child: isIcon == false
          ? AppSmallTexts(
              text: text!,
              color: color!,
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
