import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/feature/home/domain/entity/todo.dart";
import "package:todo/feature/home/presentation/controller/home_controller.dart";
import "package:todo/feature/home/presentation/widgets/add_todo_notes_bottom_sheet.dart";
import "package:todo/feature/home/presentation/widgets/delete_dialogue.dart";
import "package:todo/routes/app_routes.dart";

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    required this.todo,
    required this.homeController,
    super.key,
  });

  final Todo todo;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) => Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: <Widget>[
            SlidableAction(
              onPressed: (BuildContext context) {
                Get.bottomSheet(
                  isScrollControlled: true,
                  backgroundColor: ThemeColors.clrWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  AddUpdateTodoNotes(todoItem: todo),
                );
              },
              backgroundColor: ThemeColors.clrGreen,
              foregroundColor: ThemeColors.clrWhite,
              icon: Icons.edit,
            ),
            SlidableAction(
              onPressed: (BuildContext context) {
                showDeleteDialog(
                  title: "strDeleteTodo".tr,
                  onConfirm: () async {
                    await homeController.deleteNotes(todo);
                  },
                );
              },
              backgroundColor: ThemeColors.clrRed,
              foregroundColor: ThemeColors.clrWhite,
              icon: Icons.delete,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          visualDensity: const VisualDensity(vertical: -4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () {
            Get.toNamed(AppRoutes.detailRoute, arguments: todo);
          },
          tileColor: ThemeColors.clrBlack400.withOpacity(0.1),
          horizontalTitleGap: 10,
          leading: CustomRadioButton(
            isSelected: todo.isCompleted!,
            onChanged: (bool bloc) {
              todo.isCompleted = bloc;
              homeController.updateNotes(todo);
            },
          ),
          title: todo.noteTitle != null && todo.noteTitle!.isNotEmpty
              ? Text(
                  todo.noteTitle ?? "",
                  style: TextStyle(
                    color: todo.isCompleted!
                        ? ThemeColors.secondColor
                        : ThemeColors.clrBlack,
                    decoration:
                        todo.isCompleted! ? TextDecoration.lineThrough : null,
                  ),
                )
              : null,
        ),
      );
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    required this.isSelected,
    required this.onChanged,
    super.key,
  });

  final bool isSelected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          onChanged(!isSelected);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ThemeColors.clrGrey,
              width: 2,
            ),
            color: isSelected ? ThemeColors.clrGrey : Colors.transparent,
          ),
          child: isSelected
              ? const Icon(
                  Icons.check,
                  color: ThemeColors.clrWhite,
                  size: 17,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.transparent,
                  size: 17,
                ),
        ),
      );
}
