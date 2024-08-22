import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:todo/core/constants/image_constants.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/core/shared/presentation/widget/common_widgets/action_button.dart";
import "package:todo/feature/auth/presentation/controller/auth_controller.dart";

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: context.mediaQuery.size.height * 0.1),
            Text(
              "strTodo".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              ImageConstants.imgLogin,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            Text(
              "strOrganizeYourWorkAndLifeFinally".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.mediaQuery.size.height * 0.2),
            ActionButton(
              onPressed: () {
                authController.loginAnonymously();
              },
              isLarge: true,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              title: "strContinueAsAGuest".tr,
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ThemeColors.clrWhite,
              ),
              borderRadius: 10,
            ),
          ],
        ),
      );
}
