import 'package:flutter/material.dart';

class BuyerInfoWidget extends StatelessWidget {
  final String buyerName;

  const BuyerInfoWidget({
    super.key,
    required this.buyerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.person_outline, size: 20),
          const SizedBox(width: 8),
          Text(
            'Comprador: $buyerName',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}