import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/save_result.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/provider/search_keyword_provider.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../routes/app_routes.dart';
import '../widgets/near_tour_item_widget.dart';

class SearchPlaceListPage extends ConsumerStatefulWidget {
  const SearchPlaceListPage({super.key});

  @override
  ConsumerState<SearchPlaceListPage> createState() => _SearchPlacePageListState();
}

class _SearchPlacePageListState extends ConsumerState<SearchPlaceListPage> {
  int? typeId;
  String keyword = '';
  final ScrollController _scrollController = ScrollController();

  double? longitude;
  double? latitude;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        if (keyword.isNotEmpty && typeId != null) {
          ref.read(searchKeywordProvider.notifier).loadNext(keyword, typeId!);
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkLocationPermission();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
    typeId = data?['contentTypeId'] as int?;
    keyword = data?['keyword'] as String;
  }

  @override
  Widget build(BuildContext context) {
    final searchData = ref.watch(searchKeywordProvider);

    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 20),
                child: Text('검색 결과', style: AppTextStyle.fontSize24WhiteExtraBold,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16,),
                  child: _getGridListView(),
                ),
              )
            ],
          )
      ),
    );
  }

  Widget _getGridListView() {
    final searchData = ref.watch(searchKeywordProvider);

    return searchData.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 370,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final location = items[index];

              return NearTourItemWidget(
                item: location,
                itemClick: (item) {
                  context.pushNamed(AppRoutes.searchTourDetail, extra: location);
                },
                buttonClick: () {
                  ref.read(savedLocationProvider.notifier).saveTourLocation(location, (result) {
                    switch(result) {
                      case Success():
                        showToast(result.message);
                        break;
                      case Failure():
                        showToast(result.message);
                        break;
                      case LoginRequired():
                        showToast(result.message);
                        context.pushNamed(AppRoutes.login);
                        break;
                      case MaxLimitReached():
                        showToast(result.message);
                        break;
                    }
                  });
                },
              );
            }
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('에러')),
    );
  }

  Future<void> _checkLocationPermission() async {
    bool hasPermission = await LocationPermissionDialog.checkAndRequestLocationPermission(context);

    if(hasPermission) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        longitude = position.longitude;
        latitude = position.latitude;

        if (mounted && keyword.isNotEmpty && typeId != null) {
          ref.read(searchKeywordProvider.notifier).getSearchKeywordResult(keyword, typeId!, 1);
        }
      }catch(e) {
        showToast('위치 정보를 가져올 수 없어요');
      }
    }
  }
}