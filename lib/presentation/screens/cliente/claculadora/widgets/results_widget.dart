import 'package:alquiler_app/presentation/screens/cliente/claculadora/add_roomie_screen.dart';
import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  final String modality;
  final double monthlyPayment;
  final double totalInterest;
  final double totalPayment;

  const ResultsWidget({
    super.key,
    required this.modality,
    required this.monthlyPayment,
    required this.totalInterest,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    if (monthlyPayment == 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Resultado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Pago mensual', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$${monthlyPayment.toStringAsFixed(2)}'),
          ],
        ),
        if (modality == 'compra') ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Intereses', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$${totalInterest.toStringAsFixed(2)}'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$${totalPayment.toStringAsFixed(2)}'),
            ],
          ),
        ],
        if (modality == 'renta')
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddRoomieScreen(),
                    ),
                  );
                },
                child: const Text('Agregar roomie'),
              )
            ),
          ),
      ],
    );
  }
}
