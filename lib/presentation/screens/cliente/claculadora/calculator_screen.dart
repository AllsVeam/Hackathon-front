import 'package:alquiler_app/presentation/screens/cliente/claculadora/widgets/interest_rate_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/claculadora/widgets/modality_selector_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/claculadora/widgets/renta_options_widget.dart';
import 'package:alquiler_app/presentation/screens/cliente/claculadora/widgets/results_widget.dart';
import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _modality = 'renta';
  double _amount = 0;
  int _period = 0;
  String _periodUnit = 'meses';
  double _interestRate = 0.0938;
  bool _splitAmount = false;
  int _peopleCount = 1;

  void _calculate() {
    setState(() {
      // Re-calculamos en cada cambio
    });
  }

  @override
  Widget build(BuildContext context) {
    double monthlyPayment = 0;
    double totalInterest = 0;
    double totalPayment = 0;

    if (_amount > 0 && _period > 0) {
      if (_modality == 'compra') {
        int totalMonths = _periodUnit == 'años' ? _period * 12 : _period;
        double monthlyRate = _interestRate / 12;

        if (monthlyRate > 0) {
          monthlyPayment = _amount * (monthlyRate * (1 + monthlyRate) * totalMonths) / ((1 + monthlyRate) * totalMonths - 1);
        } else {
          monthlyPayment = _amount / totalMonths;
        }

        totalPayment = monthlyPayment * totalMonths;
        totalInterest = totalPayment - _amount;

      } else if (_modality == 'renta') {
        if (_splitAmount && _peopleCount > 0) {
          monthlyPayment = _amount / _peopleCount;
        } else {
          monthlyPayment = _amount;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModalitySelector(
              onChanged: (String? value) {
                setState(() {
                  _modality = value ?? 'renta';
                  if (_modality == 'compra') {
                    _periodUnit = 'años';
                  } else {
                    _periodUnit = 'meses';
                  }
                });
                _calculate();
              },
            ),
            const SizedBox(height: 16),
            const Text('Cantidad', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _amount = double.tryParse(value) ?? 0;
                _calculate();
              },
              decoration: const InputDecoration(hintText: 'Ej. 100000'),
            ),
            const SizedBox(height: 16),
            const Text('Periodo', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _period = int.tryParse(value) ?? 0;
                      _calculate();
                    },
                    decoration: const InputDecoration(hintText: 'Ej. 12'),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _periodUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _periodUnit = newValue!;
                    });
                    _calculate();
                  },
                  items: <String>['meses', 'años']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_modality == 'compra')
              InterestRateWidget(
                onChanged: (double value) {
                  _interestRate = value;
                  _calculate();
                },
              ),
            if (_modality == 'renta')
              RentaOptionsWidget(
                onSplitChanged: (bool value) {
                  setState(() {
                    _splitAmount = value;
                  });
                  _calculate();
                },
                onPeopleCountChanged: (int value) {
                  setState(() {
                    _peopleCount = value;
                  });
                  _calculate();
                },
              ),
            const SizedBox(height: 32),
            ResultsWidget(
              modality: _modality,
              monthlyPayment: monthlyPayment,
              totalInterest: totalInterest,
              totalPayment: totalPayment,
            ),
          ],
        ),
      ),
    );
  }
}
