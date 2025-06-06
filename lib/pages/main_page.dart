import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/pages/home_page.dart';
import 'package:stamp_way_flutter/pages/my_page.dart';
import 'package:stamp_way_flutter/pages/search_page.dart';

final currentTabProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);

    return Scaffold(
      body: _getCurrentPage(currentTab),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Theme(
          // 바텀네비 탭 클릭시 나오는 이펙트? 삭제
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.color2a2a2a,
            selectedItemColor: AppColors.colorFF8C00,
            unselectedItemColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentTab,
            onTap: (index) {
              ref.read(currentTabProvider.notifier).state = index;
            },
            // currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My'
              )
            ]
               ),
        ),
      ),
    );
  }

  Widget _getCurrentPage(int index) {
    switch(index) {
      case 0:
        return HomePage();
      case 1:
        return SearchPage();
      case 2:
        return MyPage();
      default:
        return HomePage();
    }
  }
}
