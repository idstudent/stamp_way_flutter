import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/save_result.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/get_location_provider.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/provider/search_keyword_provider.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../routes/app_routes.dart';
import '../widgets/grid_near_tour_item_widget.dart';

class SearchPlaceListPage extends ConsumerStatefulWidget {
  const SearchPlaceListPage({super.key});

  @override
  ConsumerState<SearchPlaceListPage> createState() => _SearchPlacePageListState();
}

class _SearchPlacePageListState extends ConsumerState<SearchPlaceListPage> {
  int? typeId;
  String keyword = '';
  final ScrollController _scrollController = ScrollController();

  int page = 1;
  List<TourMapper> allItems = [];
  bool isLoading = false;
  bool hasMore = true;

  double? longitude;
  double? latitude;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
    typeId = data?['contentTypeId'] as int?;
    keyword = data?['keyword'] as String;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkLocationPermission();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        if (!isLoading && hasMore) {
          _loadNextPage();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(searchKeywordProvider, (previous, next) {
      next.when(
        data: (newItems) {
          if(mounted) {
            setState(() {
              if (page == 1) {
                allItems = List.from(newItems);
              } else {
                final item = newItems.where((newItem) {
                  return !allItems.any((existingItem) =>
                  existingItem.contentid == newItem.contentid);
                }).toList();

                allItems.addAll(item);

                if (newItems.length < 20) {
                  hasMore = false;
                }
              }
              isLoading = false;
            });
          }
        },
        error: (error, stack) {
          print('에러: $error');
          if(mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
        loading: () {},
      );
    });

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
    if (allItems.isEmpty && isLoading) {
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
        itemCount: allItems.length,
        itemBuilder: (context, index) {
          final location = allItems[index];

          return GridNearTourItemWidget(
            item: location,
            itemClick: (item) {
             context.pushNamed(AppRoutes.tourDetail, extra: location);
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
  }

  Future<void> _checkLocationPermission() async {
    bool hasPermission = await LocationPermissionDialog.checkAndRequestLocationPermission(context);

    if(hasPermission) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        longitude = position.longitude;
        latitude = position.latitude;

        if (mounted) {
          setState(() {
            page = 1;
            allItems.clear();
            hasMore = true;
            isLoading = true;
          });

          ref.read(searchKeywordProvider.notifier).getSearchKeywordResult(
              keyword, typeId!, page
          );
        }
      }catch(e) {
        showToast('위치 정보를 가져올 수 없어요');
      }
    }
  }

  void _loadNextPage() {
    if (isLoading || !hasMore || !mounted) return;

    if(mounted) {
      setState(() {
        isLoading = true;
        page++;
      });

      ref.read(searchKeywordProvider.notifier).getSearchKeywordResult(
          keyword, typeId!, page
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}