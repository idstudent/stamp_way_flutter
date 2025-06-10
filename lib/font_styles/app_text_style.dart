import 'package:flutter/material.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';

class AppTextStyle {
  static const TextStyle fontSize24WhiteExtraBold = TextStyle(
    fontSize: 24, color: AppColors.white, fontFamily: 'noto_extra_bold'
  );

  static const TextStyle fontSize20White = TextStyle(
    fontSize: 20, color: AppColors.white
  );

  static const TextStyle fontSize16WhiteRegular = TextStyle(
      fontSize: 16, color: AppColors.white, fontFamily: 'noto_regular'
  );

  static const TextStyle fontSize14WhiteSemiBold = TextStyle(
      fontSize: 14, color: AppColors.white, fontFamily: 'noto_semi_bold'
  );
}