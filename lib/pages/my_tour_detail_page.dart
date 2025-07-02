import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/save_result.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';
import 'package:stamp_way_flutter/provider/tour_detail_provider.dart';
import 'package:stamp_way_flutter/util/location_permission_dialog.dart';
import 'package:stamp_way_flutter/util/remove_html.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

import '../colors/app_colors.dart';
import '../model/tour_detail_response.dart';

class MyTourDetailPage extends ConsumerStatefulWidget {
  const MyTourDetailPage({super.key});

  @override
  ConsumerState<MyTourDetailPage> createState() => _MyTourDetailPageState();
}

class _MyTourDetailPageState extends ConsumerState<MyTourDetailPage> {
  SavedLocation? savedLocation;
  bool hasPermission = false;
  bool btnVisible = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      if(mounted) {
        setState(() {
          final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
          savedLocation = data?['savedLocation'] as SavedLocation?;
          btnVisible = data?['btnVisible'] ?? true;
        });

        hasPermission = await LocationPermissionDialog.checkAndRequestLocationPermission(context);

        ref.read(tourDetailProvider.notifier).getTourDetail(
            savedLocation?.contentId ?? -1,
            savedLocation?.contentTypeId ?? -1
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final detailItem = ref.watch(tourDetailProvider);
    final savedLocations = ref.watch(savedLocationProvider);
    final isSaved = savedLocations.any((location) => location.contentId == savedLocation?.contentId);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                savedLocation!.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    color: AppColors.color2a2a2a,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(savedLocation?.title ?? '', style: AppTextStyle.fontSize20WhiteExtraBold,),
                    SizedBox(height: 8,),
                    Text(savedLocation?.address ?? '', style: AppTextStyle.fontSize16WhiteSemiBold,)
                  ],
                ),
              ),
              _contentByTypeUi(detailItem),
            ],
          ),
        )
      ),

      bottomNavigationBar: btnVisible
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.colorFF8C00
              ),
              margin: EdgeInsets.all(20),
              height: 48,
              child: TextButton(
                onPressed: () {
                  if(savedLocation != null) {
                    _stampClick();
                  }
                },
                child: Text('스탬프 찍기', style: AppTextStyle.fontSize20WhiteSemiBold,),
              ),
            )
          : null
    );
  }

  Future<void> _stampClick() async {
    try {
      if(!hasPermission) {
        showToast('위치 권한이 필요해요');
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      double distanceBetween = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        savedLocation!.latitude,
        savedLocation!.longitude,
      );

      if(distanceBetween <= 300) {
        ref.read(savedLocationProvider.notifier).updateVisitStatus(savedLocation!.contentId, (success, message) {
          if(success) {
            showToast(message!);
            context.pop();
          }
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

  Widget _contentByTypeUi(AsyncValue<List<DetailItem>> detailItem) {
    return detailItem.when(
      data: (item) {
        switch(savedLocation?.contentTypeId ?? -1) {
          case 12: return _tourUi(item[0]);
          case 14: return _cultureUi(item[0]);
          case 15: return _eventUi(item[0]);
          case 28: return _activityUi(item[0]);
          case 39: return _foodUi(item[0]);
          default: return SizedBox.shrink();
        }
      },
      error: (error, stack) => Center(child: Text('상세 정보를 가져올 수 없습니다.'),),
      loading: () => Center(child: CircularProgressIndicator(),),
    );
  }

  Widget _tourUi(DetailItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailContent('개장일:', '${item.eventStartDate}'),
        _detailContent('휴무일:', '${item.restDate}'),
        _detailContent('이용 가능 시간:', '${item.useTime}'),
        SizedBox(height: 40,),
      ],
    );
  }

  Widget _cultureUi(DetailItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailContent('휴무일:', '${item.cultureRestDate}'),
        _detailContent('이용 가능 시간:', '${item.cultureUseTime}'),
        _detailContent('이용 요금:', '${item.culturePrice}'),
        _detailContent('주차:', '${item.cultureParking}'),
        _detailContent('주차 요금:', '${item.cultureParkingFee}'),
        _detailContent('문의:', '${item.cultureInfoCenter}'),
        SizedBox(height: 40,),
      ],
    );
  }

  Widget _eventUi(DetailItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailContent('행사 시작일:', '${item.eventStartDate}'),
        _detailContent('행사 종료일:', '${item.eventEndDate}'),
        _detailContent('행사 시간:', '${item.eventPlayTime}'),
        _detailContent('장소:', '${item.eventPlace}'),
        _detailContent('이용 금액:', '${item.eventUsePrice}'),
        _detailContent('주최자:', '${item.eventSponsor}'),
        _detailContent('주최자 문의:', '${item.eventSponsorTel}'),
        SizedBox(height: 40,),
      ],
    );
  }

  Widget _activityUi(DetailItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailContent('휴무일:', '${item.activityRestDate}'),
        _detailContent('이용 가능 시간:', '${item.activityUseTime}'),
        _detailContent('이용 가능 연령:', '${item.activityPossibleAge}'),
        _detailContent('주차 및 요금:', '${item.activityParking}'),
        _detailContent('예약 안내:', '${item.activityReservation}'),
        _detailContent('문의:', '${item.activityInfoCenter}'),
        SizedBox(height: 40,),
      ],
    );
  }

  Widget _foodUi(DetailItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailContent('휴무일:', '${item.activityRestDate}'),
        _detailContent('영업 시간:', '${item.activityUseTime}'),
        _detailContent('대표 메뉴:', '${item.activityPossibleAge}'),
        _detailContent('메뉴:', '${item.activityParking}'),
        _detailContent('포장:', '${item.activityReservation}'),
        _detailContent('문의:', '${item.activityInfoCenter}'),
        SizedBox(height: 40,),
      ],
    );
  }

  Widget _detailContent(String label, String? content) {
    if(content == 'null' || content == '') {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        '$label ${removeHtmlTags(content)}',
        style: AppTextStyle.fontSize16WhiteSemiBold,
      ),
    );
  }
}
