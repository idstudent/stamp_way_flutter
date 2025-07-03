import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/save_result.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/get_location_provider.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../routes/app_routes.dart';
import '../widgets/near_tour_item_widget.dart';

class NearPlaceListPage extends ConsumerStatefulWidget {
  const NearPlaceListPage({super.key});

  @override
  ConsumerState<NearPlaceListPage> createState() => _NearPlaceListPageState();
}

class _NearPlaceListPageState extends ConsumerState<NearPlaceListPage> {
  int? typeId;
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

    typeId ??= GoRouterState.of(context).extra as int? ?? 12;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkLocationPermission();
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        if (longitude != null && latitude != null) {
          ref.read(getLocationProvider.notifier).loadNext(longitude!, latitude!, typeId!);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationData = ref.watch(getLocationProvider);

    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 20),
                child: Text(_getTitle(), style: AppTextStyle.fontSize24WhiteExtraBold,),
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
    final locationData = ref.watch(getLocationProvider);

    return locationData.when(
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

        if (mounted) {
          ref.read(getLocationProvider.notifier).getLocationTourList(longitude!, latitude!, 1, typeId!);
        }
      }catch(e) {
        showToast('위치 정보를 가져올 수 없어요');
      }
    }
  }

  String _getTitle() {
    switch(typeId) {
      case 12: return "내 근처 여행지";
      case 14: return "내 근처 문화 시설";
      case 15: return "내 근처 축제";
      case 28: return "내 근처 액티비티";
      case 39: return "내 근처 식당";
      default: return "내 근처 여행지";
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}