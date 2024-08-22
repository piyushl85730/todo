import "package:get/get.dart";
import "package:todo/feature/auth/domain/usecases/login_anonymously.dart";
import "package:todo/feature/home/domain/usecases/notes.dart";

class InjectableUseCases {
  InjectableUseCases.inject() {
    Get
      ..lazyPut<LoginAnonymouslyUC>(
        () => LoginAnonymouslyUC(authRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<FetchNotesUC>(
        () => FetchNotesUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<CreateNoteUC>(
        () => CreateNoteUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<UpdateNoteUC>(
        () => UpdateNoteUC(homeRepository: Get.find()),
        fenix: true,
      )
      ..lazyPut<DeleteNoteUC>(
        () => DeleteNoteUC(homeRepository: Get.find()),
        fenix: true,
      );
  }
}
