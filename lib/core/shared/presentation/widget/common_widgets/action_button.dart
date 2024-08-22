import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:todo/core/constants/theme_constants.dart";

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.onPressed,
    this.titleImage,
    this.title,
    this.titleIcon,
    this.margin,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.isLarge = false,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final String? titleImage;
  final String? title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isLarge;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? titleIcon;

  @override
  Widget build(BuildContext context) => Container(
        margin: (margin != null) ? margin : EdgeInsets.zero,
        child: isLarge
            ? Row(
                children: <Widget>[Expanded(child: getElevatedButton(context))],
              )
            : getElevatedButton(context),
      );

  Widget getElevatedButton(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor:
              Theme.of(context).brightness == Brightness.dark
                  ? ThemeColors.clrBlack400
                  : ThemeColors.clrDisable,
          backgroundColor: backgroundColor ?? ThemeColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
          ),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        child: (title != null && titleImage != null)
            ? Row(
                children: <Widget>[
                  Image.asset(
                    titleImage!,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    color: ThemeColors.clrWhite,
                    height: 30,
                    width: 30,
                  ),
                  10.horizontalSpace,
                  Text(
                    title!,
                    style: textStyle ??
                        TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              )
            : titleImage != null
                ? Image.asset(
                    titleImage!,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    height: 30,
                    width: 30,
                  )
                : titleIcon != null
                    ? Icon(titleIcon, size: 30)
                    : Text(
                        title!,
                        style: textStyle ??
                            const TextStyle(
                              fontSize: 16,
                              color: ThemeColors.clrWhite,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
      );
}
