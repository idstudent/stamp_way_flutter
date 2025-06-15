import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';

import '../routes/app_routes.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int categoryId;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.categoryId
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(
          AppRoutes.nearPlaceList,
          extra: categoryId
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.color2a2a2a,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: AppColors.white,),
              Text(title, style: AppTextStyle.fontSize14WhiteSemiBold,)
            ],
          ),
        ),
      ),
    );
  }
}
