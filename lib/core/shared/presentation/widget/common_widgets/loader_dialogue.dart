import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:todo/core/constants/theme_constants.dart";

void showLoader() => Get.dialog(
      PopScope(
        canPop: false,
        child: UnconstrainedBox(
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: ThemeColors.clrWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: ThemeColors.accentColor),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

void dismissLoader() => Get.back();
