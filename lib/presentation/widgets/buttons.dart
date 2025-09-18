import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final TextStyle style;

  const TextTitle({Key? key, required this.text, required this.style})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style.copyWith(decoration: TextDecoration.none));
  }
}

class TexButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final VoidCallback onPressed;

  const TexButton({
    Key? key,
    required this.text,
    required this.style,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: style),
    );
  }
}
