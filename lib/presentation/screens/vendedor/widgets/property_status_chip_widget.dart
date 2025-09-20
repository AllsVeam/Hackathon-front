import 'package:flutter/material.dart';

class PropertyStatusChipWidget extends StatelessWidget {
  final String status; // 'Vendido', 'Publicado', 'Revisión'

  const PropertyStatusChipWidget({
    super.key,
    required this.status,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Vendido':
        return Colors.green;
      case 'Rentado': // Agregamos Rentado si es necesario
        return Colors.green;
      case 'Publicado':
        return Colors.blue;
      case 'Revisión':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = _getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1), // Un poco más claro que el color del texto
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}