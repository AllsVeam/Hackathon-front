import 'package:flutter/material.dart';

class ModalitySelector extends StatelessWidget {
  final Function(String?) onChanged;

  const ModalitySelector({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modalidad', style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButtonFormField<String>(
          value: 'renta',
          items: const [
            DropdownMenuItem(value: 'renta', child: Text('Renta')),
            DropdownMenuItem(value: 'compra', child: Text('Compra')),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
