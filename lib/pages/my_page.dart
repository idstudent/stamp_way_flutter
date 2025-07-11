import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/level_info.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/provider/user_provider.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/routes/app_routes.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> {
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userProvider);
    final visitedLocation = ref.watch(visitedLocationProvider);
    final certifyCount = ref.watch(certificationCountProvider);

    final allList = visitedLocation['allList'] as List<SavedLocation>? ?? [];

    final tourList = (visitedLocation['tourPlaceList'] as List<SavedLocation>? ?? []);
    final tourListCount = tourList.length;

    final cultureList = (visitedLocation['cultureList'] as List<SavedLocation>? ?? []);
    final cultureListCount = cultureList.length;

    final eventList = (visitedLocation['eventList'] as List<SavedLocation>? ?? []);
    final eventListCount = eventList.length;

    final activityList = (visitedLocation['activityList'] as List<SavedLocation>? ?? []);
    final activityListCount = activityList.length;

    final foodList = (visitedLocation['foodList'] as List<SavedLocation>? ?? []);
    final foodListCount = foodList.length;

    final completeCount = allList.where((location) => location.isVisited).length;
    final notCompleteCount = allList.where((location) => !location.isVisited).length;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.settings, size: 32,),
                  color: AppColors.white,
                  onPressed: () {
                    context.pushNamed(AppRoutes.setting);
                  },
                ),
              ),
              Row(
                children: [
                  Icon(Icons.account_circle, color: AppColors.white, size: 60,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 20),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () async {
                          if (userInfo == null) {
                            context.pushNamed(AppRoutes.login);
                          }
                        },
                        child: Text(
                          userInfo?['nickname'] as String? ?? '로그인이 필요해요',
                          style: AppTextStyle.fontSize20WhiteRegular,
                        ),
                      )
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.color2a2a2a,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.myCompleteList, extra: {
                              'tourList': tourList,
                              'cultureList': cultureList,
                              'eventList': eventList,
                              'activityList': activityList,
                              'foodList': foodList,
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20,),
                                Icon(Icons.tour, size: 40, color: AppColors.colorFF8C00,),
                                const SizedBox(height: 8,),
                                Text(completeCount.toString(), style: AppTextStyle.fontSize20WhiteExtraBold,),
                                Text('완료', style: AppTextStyle.fontSize16WhiteExtraBold,),
                                const SizedBox(height: 20,)
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.pushNamed(AppRoutes.myTourList),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20,),
                                Icon(Icons.checklist, size: 40, color: AppColors.colorFF8C00,),
                                const SizedBox(height: 8,),
                                Text(notCompleteCount.toString(), style: AppTextStyle.fontSize20WhiteExtraBold,),
                                Text('예정', style: AppTextStyle.fontSize16WhiteExtraBold,),
                                const SizedBox(height: 20,)
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            context.pushNamed(AppRoutes.myCertification, extra: {
                              'tourList': tourList,
                              'cultureList': cultureList,
                              'eventList': eventList,
                              'activityList': activityList,
                              'foodList': foodList,
                            })
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20,),
                                Icon(Icons.auto_awesome, size: 40, color: AppColors.colorFF8C00,),
                                const SizedBox(height: 8,),
                                Text(certifyCount.toString(), style: AppTextStyle.fontSize20WhiteExtraBold,),
                                Text('인증 획득', style: AppTextStyle.fontSize16WhiteExtraBold,),
                                const SizedBox(height: 20,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Text('나의 모험 레벨', style: AppTextStyle.fontSize20WhiteExtraBold),
              ),
              _levelWidget(CategoryLevel.tour, calculateLevel(tourListCount, CategoryLevel.tour)),
              _levelWidget(CategoryLevel.culture, calculateLevel(cultureListCount, CategoryLevel.culture)),
              _levelWidget(CategoryLevel.event, calculateLevel(eventListCount, CategoryLevel.event)),
              _levelWidget(CategoryLevel.activity, calculateLevel(activityListCount, CategoryLevel.activity)),
              _levelWidget(CategoryLevel.food, calculateLevel(foodListCount, CategoryLevel.food)),
              userInfo != null
                  ? Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){
                        logout();
                      },
                      child: Text('로그아웃', style: AppTextStyle.fontSize14WhiteRegular,)
                    ),
                  )
                  : SizedBox.shrink(),
                const SizedBox(height: 48,),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    try {
      await ref.read(userProvider.notifier).logout();
      showToast('로그아웃 되었어요');
    }catch(e) {
      showToast('로그아웃이 실패했어요');
    }
  }

  Widget _levelWidget(CategoryLevel category, LevelInfo levelInfo) {
    String title = '';

    switch(category) {
      case CategoryLevel.tour:
        title = '나의 여행지 Level';
        break;
      case CategoryLevel.culture:
        title = '나의 문화 Level';
        break;
      case CategoryLevel.event:
        title = '나의 축제 Level';
        break;
      case CategoryLevel.activity:
        title = '나의 액티비티 Level';
        break;
      case CategoryLevel.food:
        title = '나의 먹방 Level';
        break;
    }

    String subtitle = category.subTitleFormat.replaceFirst('%d',
        levelInfo.level == category.beginnerLevel ? '10' :
        levelInfo.level == category.intermediateLevel ? '30' :
        '50'
    );

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.color2a2a2a,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.fontSize20WhiteExtraBold,),
              const SizedBox(height: 8,),
              Text(subtitle, style: AppTextStyle.fontSize16WhiteSemiBold,),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(levelInfo.level, style: AppTextStyle.fontSize16WhiteRegular,),
                  Text('${levelInfo.currentCount} / ${levelInfo.targetCount}', style: AppTextStyle.fontSize16WhiteRegular,)
                ],
              ),
              const SizedBox(height: 8,),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: LinearProgressIndicator(
                  value: levelInfo.progress / 100.0,
                  backgroundColor: AppColors.color3d3d3d,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorFF8C00),
                  minHeight: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  LevelInfo calculateLevel(int visitedCount, CategoryLevel category) {
    if (visitedCount < 10) {
      return LevelInfo(
        level: category.beginnerLevel,
        currentCount: visitedCount,
        targetCount: 10,
        progress: (visitedCount * 100) ~/ 10,
      );
    } else if (visitedCount < 30) {
      return LevelInfo(
        level: category.intermediateLevel,
        currentCount: visitedCount,
        targetCount: 30,
        progress: (visitedCount * 100) ~/ 30,
      );
    } else {
      return LevelInfo(
        level: category.advancedLevel,
        currentCount: visitedCount,
        targetCount: 50,
        progress: (visitedCount * 100) ~/ 50,
      );
    }
  }
}
