import "package:get/get.dart";
import "package:todo/feature/auth/data/repositories/auth_repository_impl.dart";
import "package:todo/feature/auth/domain/repositories/auth_repository.dart";
import "package:todo/feature/home/data/repositories/home_repository_impl.dart";
import "package:todo/feature/home/domain/repositories/home_repository.dart";

class InjectableRepositories {
  InjectableRepositories.inject() {
    Get
      ..lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDataSource: Get.find()),
        fenix: true,
      )
      ..lazyPut<HomeRepository>(
        () => HomeRepositoryImpl(homeRemoteDataSource: Get.find()),
        fenix: true,
      );
  }
}
