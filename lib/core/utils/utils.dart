import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/constants/theme_constants.dart";
import "package:todo/core/utils/library/basic_utils/basic_utils.dart";

/// dynamic date formatter
// String dateFormat({DateTime? date, String? pattern}) =>
//     DateFormat(pattern ?? "dd-MM-yyyy").format(date ?? DateTime.now());

/// Showing the toast with custom fields
Future<void> showToast({
  required String title,
  String? subTitle,
  SnackPosition? position,
  Duration? duration,
}) async {
  if (Get.isSnackbarOpen) {
    await Get.closeCurrentSnackbar();
  }
  Get.snackbar(
    title,
    subTitle ?? "",
    messageText:
        StringUtils.isNullOrEmpty(subTitle) ? const SizedBox.shrink() : null,
    colorText: ThemeColors.clrWhite,
    backgroundColor: ThemeColors.accentColor,
    snackPosition: position ?? SnackPosition.BOTTOM,
    duration: duration ?? 1.seconds,
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(20),
  );
}

Future<bool> checkInternetConnect() async {
  try {
    final List<InternetAddress> result =
        await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
