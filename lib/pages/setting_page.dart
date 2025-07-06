import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/routes/app_routes.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text('설정', style: AppTextStyle.fontSize20WhiteExtraBold,),
            ),
            SizedBox(height: 48,),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.privacy);
              } ,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Text('개인정보 처리 방침', style: AppTextStyle.fontSize16WhiteRegular,),
              ),
            ),
            GestureDetector(
              onTap: () => context.pushNamed(AppRoutes.withdraw),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Text('회원탈퇴', style: AppTextStyle.fontSize16WhiteRegular,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20),
              child: Text('문의: sm1374@naver.com', style: AppTextStyle.fontSize16WhiteRegular,),
            ),
          ],
        )
      ),
    );
  }
}
