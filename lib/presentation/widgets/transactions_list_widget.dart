import 'package:alquiler_app/domain/entities/transaction.dart';
import 'package:alquiler_app/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  final int? total;
  const TransactionsList({super.key, this.total});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context);

    if (transactions.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (transactions.transfers.isEmpty) {
      return const Center(child: Text("Sin transferencias"));
    }

    final length = total != null
        ? (transactions.transfers.length > total!
              ? total!
              : transactions.transfers.length)
        : transactions.transfers.length;

    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        final tx = transactions.transfers[index];
        return _ListTrans(tx);
      },
    );
  }
}

class _ListTrans extends StatelessWidget {
  final TransactionModel tx;
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
