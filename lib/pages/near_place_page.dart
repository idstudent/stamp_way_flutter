import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/provider/get_location_provider.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../widgets/grid_tour_item_widget.dart';

class NearPlacePage extends ConsumerStatefulWidget {
  const NearPlacePage({super.key});

  @override
  ConsumerState<NearPlacePage> createState() => _NearPlacePageState();
}

class _NearPlacePageState extends ConsumerState<NearPlacePage> {
  int? typeId;
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  double? longitude;
  double? latitude;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (typeId == null) {
      typeId = GoRouterState.of(context).extra as int? ?? 12;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _checkLocationPermission();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nearTourList = ref.watch(getLocationProvider);

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
                  child: nearTourList.when(
                    data: (item) {
                      return GridView.builder(
                        controller: _scrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 410,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            return GridTourItemWidget(item: item[index]);
                          }
                      );
                    },
                    error: (error, stack) {
                      return Center(child: Text('오류 발생 $error'),);
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator(),);
                    },
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  Future<void> _checkLocationPermission() async {
    bool hasPermission = await LocationPermissionDialog.checkAndRequestLocationPermission(context);

    if(hasPermission) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        longitude = position.longitude;
        latitude = position.latitude;

        ref.read(getLocationProvider.notifier).getLocationTourList(
            longitude!, latitude!, page, typeId!);
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
