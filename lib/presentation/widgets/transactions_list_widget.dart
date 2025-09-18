import 'package:alquiler_app/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction(
        id: 1,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/04/25',
        idUser: '1',
      ),
      Transaction(
        id: 2,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 3,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '15/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 4,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '30/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 1,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/04/25',
        idUser: '1',
      ),
      Transaction(
        id: 2,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 3,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '15/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 4,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '30/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 1,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/04/25',
        idUser: '1',
      ),
      Transaction(
        id: 2,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 3,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '15/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 4,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '30/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 1,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/04/25',
        idUser: '1',
      ),
      Transaction(
        id: 2,
        type: 'out',
        name: 'Netflix',
        concepto: 'Entertainment',
        count: 280,
        date: '01/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 3,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '15/05/25',
        idUser: '1',
      ),
      Transaction(
        id: 4,
        type: 'in',
        name: 'Salary Payment',
        concepto: 'Company Inc',
        count: 15000,
        date: '30/05/25',
        idUser: '1',
      ),
    ];
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return _ListTrans(tx);
      },
    );
  }
}

class _ListTrans extends StatelessWidget {
  final Transaction tx;
  const _ListTrans(this.tx);

  @override
  Widget build(BuildContext context) {
    final isLigth = Theme.of(context).brightness == Brightness.light;
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: tx.type == 'in' ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          tx.type == 'in' ? Icons.call_received : Icons.call_made,
          color: Colors.white,
        ),
      ),
      title: Text(
        tx.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        tx.concepto,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: isLigth ? Colors.black45 : Colors.white38,
        ),
      ),
      trailing: Column(
        children: [
          //SizedBox(height: 10),
          Text(
            tx.type == 'in' ? '+ \$${tx.count}' : '- \$${tx.count}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: tx.type == 'in' ? Colors.green : Colors.red,
            ),
          ),
          Text(
            tx.date,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
