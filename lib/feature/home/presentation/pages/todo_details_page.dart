import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/feature/home/domain/entity/todo.dart";

class TodoDetailsPage extends StatelessWidget {
  TodoDetailsPage({super.key});

  final Todo todo = Get.arguments;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(Icons.menu, color: Colors.black),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 250),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                  decoration: BoxDecoration(
                    color: ThemeColors.clrBlack400.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (todo.noteTitle != null && todo.noteTitle!.isNotEmpty)
                        Text(
                          todo.noteTitle ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ThemeColors.accentColor,
                            fontSize: 25,
                          ),
                        ),
                      Text(
                        todo.noteDescription ?? "",
                        maxLines: 5,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: ThemeColors.clrBlack400.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "strAddSubTask".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ThemeColors.accentColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: ThemeColors.clrBlack400.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    rowWidget(
                      Icons.calendar_month,
                      "strDueDate".tr,
                      "${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year.toString()}",
                    ),
                    rowWidget(
                      Icons.watch_later_outlined,
                      "strTime".tr,
                      "strNo".tr,
                    ),
                    rowWidget(
                      Icons.notifications,
                      "strReminderAt".tr,
                      "strNo".tr,
                    ),
                    rowWidget(Icons.repeat, "strRepeat".tr, "strNo".tr),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: ThemeColors.clrBlack400.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    rowWidget(Icons.notes, "strNotes".tr, "strAdd".tr),
                    rowWidget(Icons.add, "strAttachment".tr, "strAdd".tr),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget rowWidget(IconData icon, String title, String value) => Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: ThemeColors.clrBlack400.withOpacity(0.7),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 16)),
              ),
              Text(value, style: const TextStyle(fontSize: 16)),
              const Icon(Icons.navigate_next),
            ],
          ),
          const SizedBox(height: 10),
        ],
      );
}
