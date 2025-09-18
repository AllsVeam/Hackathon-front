import 'package:flutter/material.dart';

class LogoAndbBackground extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final BoxDecoration decoration;
  final double? height;
  final double? width;

  const LogoAndbBackground({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
    required this.decoration,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final double defaultSize = MediaQuery.of(context).size.height * 0.10;

    return Container(
      height: height ?? defaultSize,
      width: width ?? defaultSize,
      decoration: decoration,
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: (height ?? defaultSize) * 0.5,
        ),
      ),
    );
  }
}
