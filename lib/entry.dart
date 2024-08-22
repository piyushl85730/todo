import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:todo/core/constants/string_constants.dart";
import "package:todo/core/local_languages/languages.dart";
import "package:todo/core/shared/domain/method/methods.dart";
import "package:todo/core/utils/no_scroll_glow.dart";
import "package:todo/feature/auth/presentation/controller/auth_controller.dart";
import "package:todo/routes/app_page.dart";

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final textTheme = Theme.of(context).textTheme;
    final AuthController authController = Get.find<AuthController>();
    preLoadImages(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      ensureScreenSize: true,
      child: GetMaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(textTheme)),
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale("en", "US"),
        getPages: AppPage.list,
        initialRoute: authController.pageBootStrapNavigation(),
        scrollBehavior: NoGlowScrollBehavior(),
      ),
    );
  }
}
