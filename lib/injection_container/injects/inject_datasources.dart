import "package:get/get.dart";
import "package:todo/feature/auth/data/datasources/auth_remote_datasource.dart";
import "package:todo/feature/home/data/datasources/home_remote_datasource.dart";

class InjectableDataSources {
  InjectableDataSources.inject() {
    Get
      ..lazyPut<AuthRemoteDataSource>(
        AuthRemoteDataSourceImpl.new,
        fenix: true,
      )
      ..lazyPut<HomeRemoteDataSource>(
        HomeRemoteDataSourceImpl.new,
        fenix: true,
      );
  }
}
