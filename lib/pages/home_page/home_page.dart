import 'package:flutter/material.dart';
import 'package:travulla/misc/colors.dart';
import 'package:travulla/widgets/large_text.dart';
import 'package:travulla/widgets/small_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Widget kconstHeight = const SizedBox(height: 15);
  Widget kconstWidth = const SizedBox(width: 15);

  var exploreImages = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Layaking',
    'snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 70, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor),
                )
              ],
            ),
            kconstHeight,
            const AppLargeText(
              text1: 'Discover',
            ),
            // kconstHeight,
            // kconstHeight,
            //tabbar
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircularTabIndicator(color: AppColors.mainColor, radius: 3),
                tabs: const [
                  Tab(
                    text: 'Places',
                  ),
                  Tab(
                    text: 'Inspiration',
                  ),
                  Tab(
                    text: 'Emotions',
                  ),
                ],
              ),
            ),

            //tab bar view
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/mountain.jpeg'))),
                      );
                    }),
                Text('There'),
                Text('Bye'),
              ]),
            ),

            // explore more text
            kconstHeight,
            kconstHeight,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLargeText(
                  text1: 'Explore more',
                  size: 22,
                ),
                AppSmallTexts(
                  text: 'See all',
                  color: AppColors.textColor1,
                  size: 14,
                )
              ],
            ),
            Container(
              height: 110,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          Container(
                            // margin: const EdgeInsets.only(right: 50),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.buttonBackground,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/${exploreImages.keys.elementAt(index)}',
                                    ))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(exploreImages.values.elementAt(index))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CircularTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircularTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
