import 'package:flutter/material.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

class GridTourItemWidget extends StatelessWidget {
  final TourMapper item;

  const GridTourItemWidget({
    required this.item,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // 상세 페이지 이동
      },
      child: Container(
        height: 370,
        decoration: BoxDecoration(
          color: AppColors.color2a2a2a,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Image.network(
                    item.firstimage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  item.title,
                  style: AppTextStyle.fontSize16WhiteSemiBold,
                ),
                const SizedBox(height: 8,),
                Text(
                  item.addr1,
                  style: AppTextStyle.fontSize14WhiteSemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.colorFF8C00,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Text('등록', style: AppTextStyle.fontSize16WhiteSemiBold,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
