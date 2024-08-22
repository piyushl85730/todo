import "package:flutter/material.dart";
import "package:todo/core/constants/image_constants.dart";

/// PreLoading the Images into the system cache
void preLoadImages(BuildContext context) {
  for (final String image in ImageConstants.imageList) {
    precacheImage(AssetImage(image), context);
  }
  for (final String icon in IconConstants.iconList) {
    precacheImage(AssetImage(icon), context);
  }
}
