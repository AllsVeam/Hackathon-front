import 'package:flutter/material.dart';

class PropertyFormFieldWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  final String hintText;
  final TextInputType? keyboardType;
  final String? prefixText;

  const PropertyFormFieldWidget({
    super.key,
    required this.label,
    this.maxLines = 1,
    required this.hintText,
    this.keyboardType,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixText: prefixText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}