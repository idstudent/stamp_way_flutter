import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';

class GridNearTourItemWidget extends ConsumerStatefulWidget {
  final TourMapper item;
  final Function(TourMapper) itemClick;
  final VoidCallback buttonClick;

  const GridNearTourItemWidget({
    required this.item,
    required this.itemClick,
    required this.buttonClick,
    super.key
  });

  @override
  ConsumerState<GridNearTourItemWidget> createState() => _GridNearTourItemWidgetState();
}

class _GridNearTourItemWidgetState extends ConsumerState<GridNearTourItemWidget> {
  @override
  Widget build(BuildContext context) {
    final savedLocations = ref.watch(savedLocationProvider);
    final isSaved = savedLocations.any((location) => location.contentId == widget.item.contentid);

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
                    widget.item.firstimage,
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
                  widget.item.addr1,
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
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if(!isSaved) {
                      widget.buttonClick();
                    }
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSaved ? AppColors.color3d3d3d : AppColors.colorFF8C00,
                      borderRadius: BorderRadius.circular(12),
                    ),
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
