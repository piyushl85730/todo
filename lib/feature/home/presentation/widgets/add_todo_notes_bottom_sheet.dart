import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/presentation/controller/home_controller.dart";

class AddUpdateTodoNotes extends StatefulWidget {
  const AddUpdateTodoNotes({super.key, this.todoItem});

  final Todo? todoItem;

  @override
  State<AddUpdateTodoNotes> createState() => _AddUpdateTodoNotesState();
}

class _AddUpdateTodoNotesState extends State<AddUpdateTodoNotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    if (widget.todoItem != null) {
      titleController.text = widget.todoItem?.noteTitle ?? "";
      descriptionController.text = widget.todoItem?.noteDescription ?? "";
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                (widget.todoItem != null)
                    ? "strUpdateTodo".tr
                    : "strCreateTodo".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ).paddingOnly(bottom: 20),
              TextField(
                controller: titleController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "strTodoTitle".tr,
                ),
              ),
              TextField(
                controller: descriptionController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "strTodoDescription".tr,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    if (widget.todoItem != null) {
                      homeController.updateNotes(
                        Todo(
                          id: widget.todoItem?.id,
                          uid: FirebaseAuth.instance.currentUser?.uid ?? "",
                          noteTitle: titleController.text,
                          noteDescription: descriptionController.text,
                          createdDate: widget.todoItem?.createdDate,
                          updatedDate: DateTime.now().toIso8601String(),
                          isCompleted: widget.todoItem?.isCompleted,
                        ),
                      );
                    } else {
                      homeController.createNotes(
                        Todo(
                          uid: FirebaseAuth.instance.currentUser?.uid ?? "",
                          noteTitle: titleController.text,
                          noteDescription: descriptionController.text,
                          createdDate: DateTime.now().toIso8601String(),
                          updatedDate: DateTime.now().toIso8601String(),
                          isCompleted: false,
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: ThemeColors.clrWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
