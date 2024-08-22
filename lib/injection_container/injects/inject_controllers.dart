import "package:get/get.dart";
import "package:todo/feature/auth/presentation/controller/auth_controller.dart";
import "package:todo/feature/home/presentation/controller/home_controller.dart";

class InjectableControllers {
  InjectableControllers.inject() {
    Get
      ..put<AuthController>(
        AuthController(loginAnonymouslyUC: Get.find()),
        permanent: true,
      )
      ..lazyPut<HomeController>(
        () => HomeController(
          fetchNotesUC: Get.find(),
          createNoteUC: Get.find(),
          updateNoteUC: Get.find(),
          deleteNoteUC: Get.find(),
        ),
        fenix: true,
      );
  }
}
