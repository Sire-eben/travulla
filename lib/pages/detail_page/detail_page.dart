import 'package:flutter/material.dart';
import 'package:travulla/misc/colors.dart';
import 'package:travulla/widgets/app_btns.dart';
import 'package:travulla/widgets/large_text.dart';
import 'package:travulla/widgets/responsive_btn/responsive_btn.dart';
import 'package:travulla/widgets/small_texts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget kconstHeight = const SizedBox(height: 15);
  Widget kconstWidth = const SizedBox(width: 15);

  int gottenStars = 3;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [Icon(Icons.vertical_align_bottom_outlined)],
      // ),
      // drawer: Drawer(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/mountain.jpeg'),
              )),
            ),
            Positioned(
              left: 20,
              top: 50,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text1: 'Yosemite',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text1: '\$250',
                          color: AppColors.mainColor,
                          size: 24,
                        ),
                      ],
                    ),
                    // kconstHeight,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        AppSmallTexts(
                          text: 'USA California',
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                    kconstHeight,
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                              size: 14,
                            );
                          }),
                        ),
                        kconstWidth,
                        AppSmallTexts(
                          text: '(4.0)',
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    kconstHeight,
                    AppLargeText(
                      text1: 'People',
                      color: Colors.black.withOpacity(.8),
                      size: 20,
                    ),
                    AppSmallTexts(
                      text: 'Number of people in your group',
                      color: AppColors.mainTextColor,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: AppButtons(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 60,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    kconstHeight,
                    AppLargeText(
                      text1: 'Description',
                      color: Colors.black.withOpacity(.8),
                      size: 20,
                    ),
                    AppSmallTexts(
                      text:
                          'You must go for a travel. Travelling helps to get rid of pressure. '
                          'Go to the mountains to see the nature.',
                      color: AppColors.mainTextColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButtons(
                        size: 60,
                        color: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.mainColor,
                        isIcon: true,
                        icon: Icons.favorite_border_outlined,
                      ),
                      ResponsiveButton(
                        isResponsive: false,
                        width: 270,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
