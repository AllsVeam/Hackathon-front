import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentInfoWidget extends StatefulWidget {
  final String modality;
  final String time;
  final String balance;
  final bool isCurrent;

  const PaymentInfoWidget({
    super.key,
    required this.modality,
    required this.time,
    required this.balance,
    required this.isCurrent,
  });

  @override
  State<PaymentInfoWidget> createState() => _PaymentInfoWidgetState();
}

class _PaymentInfoWidgetState extends State<PaymentInfoWidget> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Valor inicial para la fecha de pago
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now().add(const Duration(days: 30)));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección de fecha de próximo pago
          const Text('Fecha de próximo pago', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Sección de modalidad, tiempo y saldo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Modalidad
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Modalidad', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.modality),
                ],
              ),
              // Tiempo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tiempo', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.time),
                ],
              ),
              // Saldo a la fecha
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Saldo a la fecha', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(widget.balance),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Sección de estatus y botón de pago
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estatus', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      widget.isCurrent ? 'Al corriente' : 'Vencido',
                      style: TextStyle(
                        color: widget.isCurrent ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para realizar el pago
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Pagar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}