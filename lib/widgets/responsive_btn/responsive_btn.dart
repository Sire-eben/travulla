import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travulla/widgets/small_texts.dart';

import '../../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  VoidCallback? action;

  ResponsiveButton(
      {super.key, this.width, this.isResponsive = false, this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: isResponsive == true ? width : 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: AppSmallTexts(
                        text: "Book Trip Now",
                        color: Colors.white,
                      ),
                    )
                  : SizedBox.shrink(),
              Image.asset('assets/images/button-one.png'),
            ]),
      ),
    );
  }
}
