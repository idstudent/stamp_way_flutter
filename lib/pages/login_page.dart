import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/provider/login_provider.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '로그인',
                style: AppTextStyle.fontSize20WhiteExtraBold,
              ),
              const SizedBox(height: 16,),

              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.color2a2a2a)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white)
                  ),
                  hintText: '이메일',
                  hintStyle: AppTextStyle.fontSize16WhiteRegular
                ),
                controller: emailController,
                style: AppTextStyle.fontSize16WhiteRegular,
              ),

              const SizedBox(height: 8,),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.color2a2a2a)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white)
                  ),
                  hintText: '비밀번호',
                  hintStyle: AppTextStyle.fontSize16WhiteRegular
                ),
                controller: passwordController,
                style: AppTextStyle.fontSize16WhiteRegular,
              ),
              const SizedBox(height: 24,),

              GestureDetector(
                onTap: () async {
                  final email = emailController.text;
                  final password = passwordController.text;

                  if(email.isEmpty || password.isEmpty) {
                    showToast('이메일과 비밀번호를 입력해주세요');
                    return;
                  }

                  final (success, msg) = await ref.read(loginProvider).signIn(email, password);

                  if(success) {
                    Navigator.of(context).pop();
                  }else {
                    showToast(msg!);
                  }
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.colorFF8C00,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: Text('로그인', style: AppTextStyle.fontSize16WhiteRegular,),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        //TODO: 회원가입
                    },
                      child: Text('회원가입', style: AppTextStyle.fontSize16WhiteRegular)
                    )
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // TODO: 비밀번호 찾기
                      },
                      child: Text('비밀번호 찾기', style: AppTextStyle.fontSize16WhiteRegular)
                    )
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
