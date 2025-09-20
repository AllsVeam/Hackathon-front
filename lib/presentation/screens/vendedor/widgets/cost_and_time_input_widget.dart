import 'package:alquiler_app/presentation/screens/vendedor/widgets/property_form_field_widget.dart';
import 'package:flutter/material.dart';


class CostAndTimeInputWidget extends StatelessWidget {
  final String selectedOption;

  const CostAndTimeInputWidget({
    super.key,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PropertyFormFieldWidget(
          label: selectedOption == 'Vender' ? 'Costo Total de vivienda' : 'Costo Total de mensualidad',
          hintText: 'Ingrese el costo',
          prefixText: '\$',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedOption == 'Vender' ? 'Plazo/años' : 'Plazo/meses',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('3', style: TextStyle(fontSize: 16)),
                        Column(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_up)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enganche', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  PropertyFormFieldWidget(
                    label: 'Enganche',
                    hintText: 'Ingrese el enganche',
                    prefixText: '\$',
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}