import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/saved_location_provider.dart';

class TourItemWidget extends ConsumerStatefulWidget {
  final TourMapper item;
  final Function(TourMapper) itemClick;
  final VoidCallback buttonClick;

  const TourItemWidget({
    required this.item,
    required this.itemClick,
    required this.buttonClick,
    super.key
  });

  @override
  ConsumerState<TourItemWidget> createState() => _TourItemWidgetState();
}

class _TourItemWidgetState extends ConsumerState<TourItemWidget> {
  @override
  Widget build(BuildContext context) {
    final savedLocations = ref.watch(savedLocationProvider);
    final isSaved = savedLocations.any((location) => location.contentId == widget.item.contentid);

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
      child: GestureDetector(
        onTap: () => widget.itemClick(widget.item),
        child: Container(
          height: 400,
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
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    widget.item.title,
                    style: AppTextStyle.fontSize16WhiteSemiBold,
                  ),
                  SizedBox(height: 8,),
                  Flexible(
                    child: Text(
                      widget.item.addr1,
                      style: AppTextStyle.fontSize14WhiteSemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
