import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/shared/extenstions/ext_dialog.dart';
import 'package:recipe/shared/extenstions/ext_widget.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../../../core/core.dart';
import '../../../../shared/widgets/widgets.dart';
import '../provider/login_provider.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLoginState(LoginState state) {
    switch (state.status) {
      case LoginStatus.initial:
        break; // ✅ Properly handle the case
      case LoginStatus.loading:
        context.showLoading();
        break;
      case LoginStatus.success:
        // context.hideLoading();
        context.router.maybePop();
        break;
      case LoginStatus.error:
        // context.hideLoading();
        context.showErrorDialog(
          title: "Error",
          msg: state.msg ?? '',
        );
        break;
    }
  }

  void _googleLogin() {
    ref.read(loginProvider.notifier).googleLogin();
  }

  @override
  Widget build(BuildContext context) {
    var loginState = ref.watch(loginProvider);
    ref.listen(loginProvider, (prev, next) {
      _handleLoginState(next);
    });
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              AppImages.bgLogin,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 150,
            ),
            Positioned(
              top: 50,
              left: 0,
              child: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: context.appColors.whiteColor,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kMargin32),
                    topRight: Radius.circular(kMargin32),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: kMargin16),
                  children: [
                    Center(
                      child: Text(
                        AppStrings.lblLogin,
                        style: context.appFonts.customFont(
                          fontSize: FontSize.s24,
                          fontWeight: FontWeight.w600,
                          color: context.appColors.primaryColor,
                        ),
                      ).paddingSymmetric(vertical: kMargin16),
                    ),
                    Center(
                      child: Text(
                        AppStrings.lblLoginDesc,
                        style: context.appFonts.customFont(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ).paddingSymmetric(vertical: kMargin16),
                    ),
                    const SizedBox(height: kMargin16),
                    CustomTextField(
                      controller: _phoneController,
                      prefix: Text(
                        "+855",
                        style: context.appFonts.customFont(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      hint: AppStrings.hintPhone,
                    ),
                    const SizedBox(height: kMargin16),
                    CustomTextField(
                      controller: _passwordController,
                      hint: AppStrings.hintPassword,
                    ),
                    const SizedBox(height: kMargin16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TouchableOpacity(
                        onTap: () {},
                        child: Text(
                          AppStrings.lblForgotPassword,
                          style: context.appFonts.customFont(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w400,
                            color: context.appColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: kMargin16),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: AppStrings.lblAgree,
                              style: context.appFonts.customFont(
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400,
                                color: context.appColors.blackColor,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  text: AppStrings.lblPrivacyPolicy,
                                  style: context.appFonts.customFont(
                                    fontSize: FontSize.s14,
                                    fontWeight: FontWeight.w600,
                                    color: context.appColors.blackColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: AppStrings.lblAnd,
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                  text: AppStrings.lblServiceAgreement,
                                  style: context.appFonts.customFont(
                                    fontSize: FontSize.s14,
                                    fontWeight: FontWeight.w600,
                                    color: context.appColors.blackColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: ".",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kMargin16),
                    PrimaryButton(label: AppStrings.lblLogin).paddingSymmetric(
                      horizontal: kMargin16,
                    ),
                    const SizedBox(height: kMargin16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text(AppStrings.lblOr),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: kMargin16,
                      children: [
                        IconButton(
                          onPressed: () {
                            _googleLogin();
                          },
                          icon: Image.asset(AppImages.icGoogle),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppImages.icApple),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppImages.icFacebook),
                        )
                      ],
                    ),
                    const SizedBox(height: kMargin16),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.lblDoNotHaveAccount,
                          style: context.appFonts.customFont(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w400,
                            color: context.appColors.blackColor,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: AppStrings.lblRegister,
                              style: context.appFonts.customFont(
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w600,
                                color: context.appColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
