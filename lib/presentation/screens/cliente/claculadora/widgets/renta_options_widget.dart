import 'package:flutter/material.dart';

class RentaOptionsWidget extends StatefulWidget {
  final Function(bool) onSplitChanged;
  final Function(int) onPeopleCountChanged;

  const RentaOptionsWidget({
    super.key,
    required this.onSplitChanged,
    required this.onPeopleCountChanged,
  });

  @override
  State<RentaOptionsWidget> createState() => _RentaOptionsWidgetState();
}

class _RentaOptionsWidgetState extends State<RentaOptionsWidget> {
  bool _splitAmount = false;
  int _peopleCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dividir cantidad', style: TextStyle(fontWeight: FontWeight.bold)),
            Switch(
              value: _splitAmount,
              onChanged: (bool value) {
                setState(() {
                  _splitAmount = value;
                });
                widget.onSplitChanged(value);
              },
            ),
          ],
        ),
        if (_splitAmount)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Número de personas'),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Ej. 3'),
                onChanged: (value) {
                  _peopleCount = int.tryParse(value) ?? 1;
                  widget.onPeopleCountChanged(_peopleCount);
                },
              ),
            ],
          ),
      ],
    );
  }
}
