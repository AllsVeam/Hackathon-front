import 'package:flutter/material.dart';

class SellerInfoWidget extends StatelessWidget {
  final String sellerName;

  const SellerInfoWidget({
    super.key,
    required this.sellerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          const Icon(Icons.person_outline, size: 24),
          const SizedBox(width: 8),
          Text(
            'Vendedor: $sellerName',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}