import 'package:flutter/material.dart';

Widget iconBottomAction(
  IconData icon,
  String? label,
  Color color, {
  double iconSize = 30,
  double buttonSize = 80,
  void Function()? onPressed,
  Color? backgroundColor,
  bool? isLigth = true,
}) {
  return Column(
    children: [
      Ink(
        width: buttonSize,
        height: buttonSize,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: IconButton(
          onPressed: onPressed ?? () {},
          icon: Icon(icon, color: color),
          iconSize: iconSize,
          padding: EdgeInsets.zero,
        ),
      ),
      if (label != null && label.isNotEmpty) SizedBox(height: 4),
      if (label != null && label.isNotEmpty)
        Text(label, style: TextStyle(fontSize: 12, color: color)),
    ],
  );
}
