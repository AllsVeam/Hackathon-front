import 'package:flutter/material.dart';

Widget iconButtonApp({
  required IconData icon,
  required Color color,
  double iconSize = 24,
  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 8),
  void Function()? onPressed,
  double buttonSize = 40,
  Color? backgroundColor,
  double borderRadius = 8,
}) {
  return Padding(
    padding: padding,
    child: Ink(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: iconSize),
        onPressed: onPressed ?? () {},
        padding: EdgeInsets.zero,
        splashRadius: buttonSize / 2,
      ),
    ),
  );
}
