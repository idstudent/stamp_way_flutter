import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';

class GridCompleteTourItemWidget extends ConsumerStatefulWidget {
  final SavedLocation item;
  final Function(SavedLocation) itemClick;

  const GridCompleteTourItemWidget({
    required this.item,
    required this.itemClick,
    super.key
  });

  @override
  ConsumerState<GridCompleteTourItemWidget> createState() => _GridMyTourItemWidgetState();
}

class _GridMyTourItemWidgetState extends ConsumerState<GridCompleteTourItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.itemClick(widget.item),
      child: Container(
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
                    widget.item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        color: AppColors.color2a2a2a,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  widget.item.title,
                  style: AppTextStyle.fontSize16WhiteSemiBold.copyWith(
                    height: 1.2, // 줄 간격 줄임
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(
                    height: 1.0,
                    leading: 0.0, // 위아래 여백 제거
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  widget.item.address,
                  style: AppTextStyle.fontSize14WhiteSemiBold.copyWith(
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(
                    height: 1.0,
                    leading: 0.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
