import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text1;
  final String? text2;
  final double? size;
  final Color? color;

  const AppLargeText(
      {super.key, required this.text1, this.text2, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      // textHeightBehavior: TextHeightBehavior(),
      text: TextSpan(
          text: "$text1\n",
          style: TextStyle(
            color: color ?? Colors.black,
            fontSize: size ?? 30,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: text2,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 26,
                fontWeight: FontWeight.w200,
              ),
            )
          ]),
    );
  }
}
