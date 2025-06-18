import 'package:flutter/material.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/level_info.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                ),
              ),
              Row(
                children: [
                  Icon(Icons.account_circle, color: AppColors.white, size: 60,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 20),
                      child: Text(
                        '로그인이 필요해요',
                        style: AppTextStyle.fontSize20WhiteRegular,
                      ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              Icon(Icons.tour, size: 40, color: AppColors.colorFF8C00,),
                              const SizedBox(height: 8,),
                              Text('0', style: AppTextStyle.fontSize20WhiteExtraBold,),
                              Text('완료', style: AppTextStyle.fontSize16WhiteExtraBold,),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              Icon(Icons.checklist, size: 40, color: AppColors.colorFF8C00,),
                              const SizedBox(height: 8,),
                              Text('0', style: AppTextStyle.fontSize20WhiteExtraBold,),
                              Text('예정', style: AppTextStyle.fontSize16WhiteExtraBold,),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              Icon(Icons.auto_awesome, size: 40, color: AppColors.colorFF8C00,),
                              const SizedBox(height: 8,),
                              Text('0', style: AppTextStyle.fontSize20WhiteExtraBold,),
                              Text('인증 획득', style: AppTextStyle.fontSize16WhiteExtraBold,),
                              const SizedBox(height: 20,)
                            ],
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
              _levelWidget(CategoryLevel.tour, calculateLevel(0, CategoryLevel.tour)),
              _levelWidget(CategoryLevel.culture, calculateLevel(0, CategoryLevel.culture)),
              _levelWidget(CategoryLevel.event, calculateLevel(0, CategoryLevel.event)),
              _levelWidget(CategoryLevel.activity, calculateLevel(0, CategoryLevel.activity)),
              _levelWidget(CategoryLevel.food, calculateLevel(0, CategoryLevel.food)),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
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
