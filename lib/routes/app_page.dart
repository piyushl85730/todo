import "package:get/get.dart";
import "package:todo/feature/auth/presentation/pages/login_page.dart";
import "package:todo/feature/home/presentation/pages/home_page.dart";
import "package:todo/feature/home/presentation/pages/todo_details_page.dart";
import "package:todo/routes/app_routes.dart";

class AppPage {
  static List<GetPage<void>> list = <GetPage<void>>[
    GetPage<void>(name: AppRoutes.initialRoute, page: LoginPage.new),
    GetPage<void>(name: AppRoutes.homeRoute, page: HomePage.new),
    GetPage<void>(name: AppRoutes.detailRoute, page: TodoDetailsPage.new),
  ];
}
