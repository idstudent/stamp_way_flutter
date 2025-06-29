import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/colors/app_colors.dart';
import 'package:stamp_way_flutter/font_styles/app_text_style.dart';
import 'package:stamp_way_flutter/provider/login_provider.dart';
import 'package:stamp_way_flutter/util/show_toast.dart';

final emailErrorProvider = StateProvider<String?>((ref) => null);
final passwordErrorProvider = StateProvider<String?>((ref) => null);
final nickNameErrorProvider = StateProvider<String?>((ref) => null);

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nicknameController = TextEditingController();

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _validateInput() {
    bool isValid = true;

    if(_emailController.text.isEmpty) {
      ref.read(emailErrorProvider.notifier).state = '이메일을 입력해주세요';
      isValid = false;
    }else if (!_isValidEmail(_emailController.text)) {
      ref.read(emailErrorProvider.notifier).state = '올바른 이메일 형식이 아닙니다';
      isValid = false;
    }

    if(_passwordController.text.isEmpty) {
      ref.read(passwordErrorProvider.notifier).state = '비밀번호를 입력해주세요';
      isValid = false;
    }else if(_passwordController.text.length < 6) {
      ref.read(passwordErrorProvider.notifier).state = '비밀번호는 6자 이상이어야 합니다';
      isValid = false;
    }

    if(_nicknameController.text.isEmpty) {
      ref.read(nickNameErrorProvider.notifier).state = '닉네임을 입력해주세요';
      isValid = false;
    }

    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);
    final nickNameError = ref.watch(nickNameErrorProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('회원가입', style: AppTextStyle.fontSize24WhiteExtraBold,),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: AppTextStyle.fontSize16WhiteRegular,
                decoration: InputDecoration(
                  hintText: '이메일',
                  hintStyle: AppTextStyle.fontSize16WhiteRegular,
                  errorText: emailError,
                  errorStyle: TextStyle(color: Colors.redAccent),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 1)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 1)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 2)
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1)
                  )
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: AppTextStyle.fontSize16WhiteRegular,
                decoration: InputDecoration(
                    hintText: '비밀번호(6자 이상)',
                    hintStyle: AppTextStyle.fontSize16WhiteRegular,
                    errorText: passwordError,
                    errorStyle: TextStyle(color: Colors.redAccent),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 1)
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 1)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 2)
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent, width: 1)
                    )
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _nicknameController,
                style: AppTextStyle.fontSize16WhiteRegular,
                decoration: InputDecoration(
                    hintText: '닉네임',
                    hintStyle: AppTextStyle.fontSize16WhiteRegular,
                    errorText: nickNameError,
                    errorStyle: TextStyle(color: Colors.redAccent),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 1)
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 1)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white, width: 2)
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent, width: 1)
                    )
                ),
              ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: () async {
                  if(_validateInput()) {
                    final (success, message) = await ref.read(loginProvider.notifier).signUp(
                      _emailController.text.toString(),
                      _passwordController.text.toString(),
                      _nicknameController.text.toString()
                    );

                    if(success) {
                      showToast('회원가입이 완료되었어요\n로그인해주세요.');
                      context.pop();
                    }else {
                      showToast('회원가입이 실패했어요');
                    }
                  }
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.colorFF8C00,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('회원가입', style: AppTextStyle.fontSize16WhiteSemiBold,),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();

    super.dispose();
  }
}
