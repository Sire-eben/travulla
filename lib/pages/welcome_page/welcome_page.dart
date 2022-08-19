import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travulla/misc/colors.dart';
import 'package:travulla/pages/navigation_pages/main_page/main_page.dart';
import 'package:travulla/widgets/large_text.dart';
import 'package:travulla/widgets/responsive_btn/responsive_btn.dart';
import 'package:travulla/widgets/small_texts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, pageIndex) => Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      'assets/images/' + images[pageIndex],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 150, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text1: "Trips",
                            text2: "Mountain",
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            width: 250,
                            child: AppSmallTexts(
                                color: AppColors.textColor2,
                                size: 14,
                                text:
                                    'Mountain hikes give you an incredible sense of freedom '
                                    'along with endurance tests'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ResponsiveButton(
                            width: 100,
                            action: pageIndex == 2
                                ? () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => const MainPage()))
                                : () => null,
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (dotsIndex) {
                          return Container(
                            width: 8,
                            height: pageIndex == dotsIndex ? 25 : 8,
                            margin: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              color: pageIndex == dotsIndex
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
