import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/widgets/category_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(savedLocationProvider.notifier).startObservingSavedLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final unVisitedLocations = ref.watch(unVisitedLocationProvider);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 32.0),
              child: Text('진행 중인 스탬프', style: AppTextStyle.fontSize24WhiteExtraBold,),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: _getStampSection(unVisitedLocations)
            ),
            SizedBox(height: 24.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.0, // 1:1 비율
                      child: CategoryWidget(
                        title: '문화',
                        icon: Icons.synagogue,
                        categoryId: 14,
                      ),
                    )
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: CategoryWidget(
                          title: '축제',
                          icon: Icons.celebration,
                          categoryId: 15,
                        ),
                      )
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: CategoryWidget(
                          title: '액티비티',
                          icon: Icons.directions_run,
                          categoryId: 28,
                        ),
                      )
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: CategoryWidget(
                          title: '음식',
                          icon: Icons.food_bank,
                          categoryId: 39,
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getStampSection(List<SavedLocation> savedLocation) {
    if(savedLocation.isEmpty) {
      return _emptyTodayStampView();
    }else {
      return _myStampViewPager(savedLocation);
    }
  }

  Widget _emptyTodayStampView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color2a2a2a,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hail, color: AppColors.white, size: 60,),
            SizedBox(height: 8,),
            Text(
              '새로운 여행을 시작해볼까요?\n방문하고 싶은 장소를 추가해보세요 ✨',
              style: AppTextStyle.fontSize16WhiteRegular,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _myStampViewPager(List<SavedLocation> savedLocation) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: savedLocation.length,
            itemBuilder: (context, index) {
              final location = savedLocation[index];

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                color: AppColors.color2a2a2a,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: (location.image != null && location.image!.isNotEmpty)
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          location.image!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              color: AppColors.color2a2a2a,
                            );
                          },
                        ),
                      ): Container(
                          width: double.infinity,
                          color: AppColors.color2a2a2a
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8,),
        SmoothPageIndicator(
          controller: _pageController,
          count: savedLocation.length,
          effect: ColorTransitionEffect(
            dotColor: AppColors.colorFF8C00.withValues(alpha: 0.3),
            activeDotColor: AppColors.colorFF8C00,
            dotHeight: 12,
            dotWidth: 12,
            spacing: 4,
            radius: 8
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
