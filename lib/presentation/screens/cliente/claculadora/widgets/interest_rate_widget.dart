import 'package:flutter/material.dart';

class InterestRateWidget extends StatelessWidget {
  final Function(double) onChanged;

  const InterestRateWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tasa de interés', style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButtonFormField<double>(
          value: 0.0938,
          items: const [
            DropdownMenuItem(value: 0.0938, child: Text('9.38%')),
            DropdownMenuItem(value: 0.0925, child: Text('9.25%')),
            DropdownMenuItem(value: 0.0350, child: Text('3.50%')),
            DropdownMenuItem(value: 0.1050, child: Text('10.50%')),
          ],
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
