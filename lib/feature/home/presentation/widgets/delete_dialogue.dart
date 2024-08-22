import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/shared/presentation/widget/common_widgets/action_button.dart";

void showDeleteDialog({
  required String title,
  required AsyncCallback onConfirm,
}) {
  Get.dialog(
    DeleteDialogue(
      title: title,
      onConfirm: onConfirm,
    ),
  );
}

class DeleteDialogue extends StatelessWidget {
  const DeleteDialogue({
    required this.title,
    required this.onConfirm,
    super.key,
  });

  final String title;
  final AsyncCallback onConfirm;

  @override
  Widget build(BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(child: Text(title)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ActionButton(
                  onPressed: Get.back,
                  title: "strCancel".tr,
                ),
                const SizedBox(width: 10),
                ActionButton(
                  onPressed: () async {
                    await onConfirm();
                    Get.back();
                  },
                  backgroundColor: Colors.red,
                  title: "strDelete".tr,
                ),
              ],
            ),
          ],
        ).paddingAll(15),
      );
}
