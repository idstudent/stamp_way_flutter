import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/widgets/grid_complete_tour_item_widget.dart';

import '../model/saved_location.dart';
import '../routes/app_routes.dart';

class MyCompleteListPage extends ConsumerStatefulWidget {
  const MyCompleteListPage({super.key});

  @override
  ConsumerState<MyCompleteListPage> createState() => _MyCompleteListPageState();
}

class _MyCompleteListPageState extends ConsumerState<MyCompleteListPage> {
  List<SavedLocation> tourList = [];
  List<SavedLocation> cultureList = [];
  List<SavedLocation> eventList = [];
  List<SavedLocation> activityList = [];
  List<SavedLocation> foodList = [];
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
    tourList = (data?['tourList'] as List<SavedLocation>? ?? [])
        .where((location) => location.isVisited)
        .toList();
    cultureList =( data?['cultureList'] as List<SavedLocation>? ?? [])
        .where((location) => location.isVisited)
        .toList();
    eventList = (data?['eventList'] as List<SavedLocation>? ?? [])
        .where((location) => location.isVisited)
        .toList();
    activityList = (data?['activityList'] as List<SavedLocation>? ?? [])
        .where((location) => location.isVisited)
        .toList();
    foodList = (data?['foodList'] as List<SavedLocation>? ?? [])
        .where((location) => location.isVisited)
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text('완료한 곳', style: AppTextStyle.fontSize20WhiteExtraBold,),
              ),
              _getGridListView('여행지',tourList),
              _getGridListView('문화',cultureList),
              _getGridListView('축제',eventList),
              _getGridListView('액티비티',activityList),
              _getGridListView('음식',foodList),

            ],
          ),
        )
      ),
    );
  }

  Widget _getGridListView(String title, List<SavedLocation> savedLocation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(title, style: AppTextStyle.fontSize20WhiteExtraBold,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 320,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: savedLocation.length,
              itemBuilder: (context, index) {
                final location = savedLocation[index];

                return GridCompleteTourItemWidget(
                  item: location,
                  itemClick: (item) {
                    context.pushNamed(AppRoutes.myTourDetail, extra: {
                      'savedLocation': location,
                      'btnVisible': false
                    });
                  }
                );
              }
          ),
        ),
      ],
    );
  }
}
