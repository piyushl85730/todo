import "dart:async";

import "package:dartz/dartz.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:get/get.dart";
import "package:todo/core/error/failure.dart";
import "package:todo/core/shared/domain/usecases/usecase.dart";
import "package:todo/core/shared/presentation/widget/common_widgets/loader_dialogue.dart";
import "package:todo/core/utils/utils.dart";
import "package:todo/feature/auth/domain/usecases/login_anonymously.dart";
import "package:todo/routes/app_routes.dart";

class AuthController extends GetxController {
  AuthController({required this.loginAnonymouslyUC});

  final LoginAnonymouslyUC loginAnonymouslyUC;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = firebaseAuth.currentUser != null;
  }

  String pageBootStrapNavigation() {
    if (isLoggedIn.value) {
      return AppRoutes.homeRoute;
    } else {
      return AppRoutes.initialRoute;
    }
  }

  Future<void> loginAnonymously() async {
    showLoader();
    final Either<Failure, String> result = await loginAnonymouslyUC(NoParams());
    await result.fold(
      (Failure left) {
        dismissLoader();
        String error = "";
        if (left is GeneralFailure) {
          error = left.error;
        }
        if (left is ServerFailure) {
          error = left.error;
        }
        showToast(title: error);
      },
      (String right) async {
        dismissLoader();
        unawaited(Get.offAllNamed(AppRoutes.homeRoute));
      },
    );
  }
}
