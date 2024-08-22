import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";
import "package:todo/core/constants/image_constants.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/feature/home/presentation/controller/home_controller.dart";
import "package:todo/feature/home/presentation/widgets/add_todo_notes_bottom_sheet.dart";
import "package:todo/feature/home/presentation/widgets/todo_list_tile.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => Column(
                mainAxisAlignment: (homeController.pendingTodoList.isEmpty &&
                        homeController.completedTodoList.isEmpty)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: <Widget>[
                  if (homeController.pendingTodoList.isEmpty &&
                      homeController.completedTodoList.isEmpty)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(LottieConstants.lottieToDo, height: 250),
                        Text(
                          "strClickToCreateYourFirstTask".tr,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 70),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "strPendingTodo".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ).paddingOnly(left: 20, top: 20, right: 20),
                        ),
                        if (homeController.pendingTodoList.isNotEmpty)
                          ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                            itemCount: homeController.pendingTodoList.length,
                            itemBuilder: (_, int index) => TodoListTile(
                              todo: homeController.pendingTodoList[index],
                              homeController: homeController,
                            ),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 5),
                          )
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                LottieConstants.lottieToDo,
                                height: 250,
                              ),
                              Text(
                                "strExcellentTodayTaskAreAllCompleted".tr,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        if (homeController.completedTodoList.isNotEmpty)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "strCompletedTodo".tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ).paddingOnly(left: 20, right: 20, top: 10),
                          ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          itemCount: homeController.completedTodoList.length,
                          itemBuilder: (_, int index) => TodoListTile(
                            todo: homeController.completedTodoList[index],
                            homeController: homeController,
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 5),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addTodoNotes,
          backgroundColor: Colors.blue,
          foregroundColor: ThemeColors.clrWhite,
          child: const Icon(Icons.add),
        ),
      );

  void addTodoNotes() {
    Get.bottomSheet(
      isScrollControlled: true,
      backgroundColor: ThemeColors.clrWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      const AddUpdateTodoNotes(),
    );
  }
}
