import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/routes/app_routes.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../widgets/grid_my_tour_item_widget.dart';

class MyTourListPage extends ConsumerStatefulWidget {
  const MyTourListPage({super.key});

  @override
  ConsumerState<MyTourListPage> createState() => _MyTourListPageState();
}

class _MyTourListPageState extends ConsumerState<MyTourListPage> {
  bool hasPermission = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(mounted) {
        hasPermission = await LocationPermissionDialog.checkAndRequestLocationPermission(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedLocations = ref.watch(unVisitedLocationProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, left: 20),
              child: Text('진행 중인 스탬프', style: AppTextStyle.fontSize24WhiteExtraBold,),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                child: _getGridListView(savedLocations),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _getGridListView(List<SavedLocation> savedLocations) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 370,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: savedLocations.length,
      itemBuilder: (context, index) {
        return GridMyTourItemWidget(
          item: savedLocations[index],
          itemClick: (item) {
            context.pushNamed(AppRoutes.myTourDetail, extra: savedLocations[index]);
          },
          buttonClick: () {
            _clickStamp(savedLocations[index]);
          },
        );
      },
    );
  }

  Future<void> _clickStamp(SavedLocation savedLocation) async{
    try {
      if(!hasPermission) {
        showToast('위치 권한이 필요해요');
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      double distanceBetween = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          savedLocation.latitude,
          savedLocation.longitude
      );

      if(distanceBetween <= 300) {
        ref.read(savedLocationProvider.notifier).updateVisitStatus(savedLocation.contentId, (_, message) {
          showToast(message!);
        });
      }else {
        showToast("해당 장소와의 거리가 너무 멀어요! (${distanceBetween.toStringAsFixed(1)}m)");
      }
    }on LocationServiceDisabledException {
      showToast('위치 권한이 없습니다');
    } on PermissionDeniedException {
      showToast('위치 권한이 없습니다');
    } catch (e) {
      showToast('위치 정보를 가져올 수 없어요');
    }
  }
}
