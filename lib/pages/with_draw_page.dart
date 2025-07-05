import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/provider/user_provider.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

class WithDrawPage extends ConsumerStatefulWidget {
  const WithDrawPage({super.key});

  @override
  ConsumerState<WithDrawPage> createState() => _WithDrawPageState();
}

class _WithDrawPageState extends ConsumerState<WithDrawPage> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right:20, bottom: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '회원탈퇴',
                style: AppTextStyle.fontSize20WhiteExtraBold.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16,),
              Text(
                '회원탈퇴를 하기 위해\n비밀번호 확인이 필요해요.',
                style: AppTextStyle.fontSize20WhiteExtraBold.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 24,),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black)
                  ),
                  hintText: '비밀번호',
                  hintStyle: AppTextStyle.fontSize16WhiteRegular.copyWith(color: AppColors.black)
                ),
                controller: passwordController,
                style: AppTextStyle.fontSize16WhiteRegular.copyWith(color: AppColors.black),
                obscureText: true,
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () async {
                  final password = passwordController.text.toString();
                  if(password.isEmpty) {
                    showToast('비밀번호를 입력해주세요.');
                    return;
                  }

                  final (success, message) = await ref.read(userProvider.notifier).deleteAccount(password);

                  if(success) {
                    showToast(message);
                    SystemNavigator.pop();
                  }else{
                    showToast(message);
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '탈퇴하기',
                    style: AppTextStyle.fontSize16WhiteRegular.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '탈퇴취소',
                    style: AppTextStyle.fontSize16WhiteRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
