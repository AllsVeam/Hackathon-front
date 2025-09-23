import 'package:flutter/material.dart';

class PayNowButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const PayNowButtonWidget({
    super.key,
    required this.onPressed,
    this.label = 'Proceder al pago',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen[400],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}