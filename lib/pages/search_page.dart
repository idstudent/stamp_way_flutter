import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';

import '../model/tour_mapper.dart';

final keywordProvider = StateProvider<String?>((ref) => null);
final contentTypeIdProvider = StateProvider<int>((ref) => -1);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  List<TourMapper> recentlySearchItem = [];
  List<TourMapper> nearSearchItem = [];

  final _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contentTypeId = ref.watch(contentTypeIdProvider);
    String filterText = '검색할 분류를 선택해주세요';

    switch(contentTypeId) {
      case 12:
        filterText = '여행지';
        break;
      case 14:
        filterText = '문화';
        break;
      case 15:
        filterText = '축제';
        break;
      case 28:
        filterText = '액티비티';
        break;
      case 39:
        filterText = '음식';
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('검색', style: AppTextStyle.fontSize20WhiteExtraBold,),
                const SizedBox(height: 48,),
                GestureDetector(
                  onTap: () {
                    _showFilterBottomSheet(context);
                  } ,
                  child: Row(
                    children: [
                      Icon(Icons.tune, color: AppColors.white, size: 24,),
                      const SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(filterText, style: AppTextStyle.fontSize16WhiteRegular,),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.color2a2a2a,
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child: TextFormField(
                          controller: _keywordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            hintText: '검색어를 입력해주세요',
                            hintStyle: AppTextStyle.fontSize16WhiteRegular
                          ),
                          style: AppTextStyle.fontSize16WhiteRegular,
                        ),
                      )
                    ),
                    const SizedBox(width: 12,),
                    GestureDetector(
                      onTap: () {
                        // TODO: 검색
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorFF8C00,
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Icon(Icons.search, color: AppColors.white,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32,),
                Text('최근 검색', style: AppTextStyle.fontSize20WhiteExtraBold,),
                const SizedBox(height: 16,),
                Container(
                  child: _getRecentlySearchResult(recentlySearchItem),
                ),
                const SizedBox(height: 48,),
                Text('내 근처에는 뭐가 있지', style: AppTextStyle.fontSize20WhiteExtraBold,),
                const SizedBox(height: 16,),
                Container(
                  child: _getMyNearSearchResult(nearSearchItem),
                ),
                const SizedBox(height: 48,),
              ],
            ),
          ),
        )
      )
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12, left: 12, bottom: 12),
                child: Text('필터', style: AppTextStyle.fontSize20WhiteRegular.copyWith(color: AppColors.black),),
              ),
              _bottomSheetFilterItem('여행지', 12),
              _bottomSheetFilterItem('문화', 14),
              _bottomSheetFilterItem('축제', 15),
              _bottomSheetFilterItem('액티비티', 28),
              _bottomSheetFilterItem('음식', 39),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomSheetFilterItem(String title, int contentTypeId) {
    return GestureDetector(
      onTap: () {
        ref.read(contentTypeIdProvider.notifier).state = contentTypeId;
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 12,),
        child: Text(
          title, 
          style: AppTextStyle.fontSize20WhiteRegular.copyWith(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getRecentlySearchResult(List<TourMapper> item) {
    if(item.isEmpty) {
      return SizedBox(height: 160, child: _emptyResultView());
    }else {
      return SizedBox(height: 160, child: _recentlyResultView());
    }
  }

  Widget _emptyResultView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color2a2a2a,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text('최근 검색한 결과가 없어요', style: AppTextStyle.fontSize16WhiteRegular,),
      ),
    );
  }

  Widget _recentlyResultView() {
    return Placeholder();
  }

  Widget _getMyNearSearchResult(List<TourMapper> item) {
    if(item.isEmpty) {
      return SizedBox(height: 160, child: _emptyNearResultView());
    }else {
      return SizedBox(height: 160, child: _nearResultView());
    }
  }
  Widget _emptyNearResultView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color2a2a2a,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
            '필터를 선택하면 내 근처에\n뭐가 있는지 보여줘요!',
            style: AppTextStyle.fontSize16WhiteRegular,
            textAlign: TextAlign.center
        ),
      ),
    );
  }

  Widget _nearResultView() {
    return Placeholder();
  }
}
