import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TransactionsCardWidget extends StatelessWidget {
  const TransactionsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCard(
                loc.income,
                '35200.00',
                '+12',
                Colors.green,
                Icons.trending_up,
                context,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildCard(
                loc.expenses,
                '15200.00',
                '-12',
                Colors.red,
                Icons.call_made,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildCard(
  String description,
  String total,
  String porcentaje,
  Color color,
  IconData icon,
  context,
) {
  final styleTextTitle = TextStyle(color: color, fontSize: 12);
  final styleTextAcount = TextStyle(
    color: Theme.of(context).primaryColorLight,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: Theme.of(context).cardColor,
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          SizedBox(height: 6),
          Text(description, style: styleTextTitle),
          SizedBox(height: 2),
          Text('\$ $total', style: styleTextAcount),
          SizedBox(height: 2),
          Text('$porcentaje%', style: styleTextTitle),
        ],
      ),
    ),
  );
}
