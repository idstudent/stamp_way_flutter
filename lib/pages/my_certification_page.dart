import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';

import '../model/saved_location.dart';

class MyCertificationPage extends ConsumerStatefulWidget {
  const MyCertificationPage({super.key});

  @override
  ConsumerState<MyCertificationPage> createState() => _MyCertificationPageState();
}

class _MyCertificationPageState extends ConsumerState<MyCertificationPage> {
  List<SavedLocation>? tourList;
  List<SavedLocation>? cultureList;
  List<SavedLocation>? eventList;
  List<SavedLocation>? activityList;
  List<SavedLocation>? foodList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final data = GoRouterState.of(context).extra as Map<String, dynamic>?;

    tourList ??= data?['tourList'] as List<SavedLocation>? ?? [];
    cultureList ??= data?['cultureList'] as List<SavedLocation>? ?? [];
    eventList ??= data?['eventList'] as List<SavedLocation>? ?? [];
    activityList ??= data?['activityList'] as List<SavedLocation>? ?? [];
    foodList ??= data?['foodList'] as List<SavedLocation>? ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('획득한 뱃지', style: AppTextStyle.fontSize20WhiteExtraBold),
                  const SizedBox(height: 20),

                  Text('여행지', style: AppTextStyle.fontSize16WhiteExtraBold),
                  const SizedBox(height: 20),
                  _badgeView(
                      visitedCount: tourList!.length,
                      images: [
                        'assets/images/tour_img_1.png',
                        'assets/images/tour_img_2.png',
                        'assets/images/tour_img_3.png',
                      ],
                      badgeName: [
                        '여행\n병아리', '방랑', '콜럼버스'
                      ]
                  ),

                  const SizedBox(height: 48),
                  Text('문화', style: AppTextStyle.fontSize16WhiteExtraBold),
                  const SizedBox(height: 20),
                  _badgeView(
                      visitedCount: cultureList!.length,
                      images: [
                        'assets/images/culture_img_1.png',
                        'assets/images/culture_img_2.png',
                        'assets/images/culture_img_3.png',
                      ],
                      badgeName: [
                        '관람', '예술인', 'Art\n그 자체'
                      ]
                  ),

                  const SizedBox(height: 48),
                  Text('축제', style: AppTextStyle.fontSize16WhiteExtraBold),
                  const SizedBox(height: 20),
                  _badgeView(
                      visitedCount: eventList!.length,
                      images: [
                        'assets/images/festival_img_1.png',
                        'assets/images/festival_img_2.png',
                        'assets/images/festival_img_3.png',
                      ],
                      badgeName: [
                        '가볍게\n즐기는 사람', '축제에\n미쳐버린 사람', '내가\n바로 MC'
                      ]
                  ),

                  const SizedBox(height: 48),
                  Text('액티비티', style: AppTextStyle.fontSize16WhiteExtraBold),
                  const SizedBox(height: 20),
                  _badgeView(
                      visitedCount: activityList!.length,
                      images: [
                        'assets/images/activity_img_1.png',
                        'assets/images/activity_img_2.png',
                        'assets/images/activity_img_3.png',
                      ],
                      badgeName: [
                        '뉴비', '고인물', '통달한\n사람'
                      ]
                  ),

                  const SizedBox(height: 48),
                  Text('음식', style: AppTextStyle.fontSize16WhiteExtraBold),
                  const SizedBox(height: 20),
                  _badgeView(
                      visitedCount: foodList!.length,
                      images: [
                        'assets/images/food_img_1.png',
                        'assets/images/food_img_2.png',
                        'assets/images/food_img_3.png',
                      ],
                      badgeName: [
                        '맛집 찾아\n해매는 뉴비', '고독한\n미식가', '먹방 신'
                      ]
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _badgeView({
    required int visitedCount,
    required List<String> images,
    required List<String> badgeName,
  }) {
    if (visitedCount < 10) {
      return const SizedBox.shrink();
    }

    List<Widget> badges = [];

    if (visitedCount >= 10) {
      badges.add(_badge(images[0], badgeName[0]));
    }

    if (visitedCount >= 30) {
      badges.add(_badge(images[1], badgeName[1]));
    }

    if (visitedCount >= 50) {
      badges.add(_badge(images[2], badgeName[2]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: badges,
    );
  }

  Widget _badge(String image, String name) {
    return Flexible(
      child: Column(
        children: [
          Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Text(
              name,
              style: AppTextStyle.fontSize16WhiteRegular,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}