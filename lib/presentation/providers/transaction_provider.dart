import 'package:alquiler_app/data/services/open_payments/open_payments_service.dart';
import 'package:alquiler_app/data/services/transaction_service.dart';
import 'package:alquiler_app/domain/entities/paymentSend.dart';
import 'package:alquiler_app/domain/entities/paymentSendResponse.dart';
import 'package:alquiler_app/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  final String userId;
  bool isLoading = true;
  List<TransactionModel> _transfers = [];
  TransactionProvider({required this.userId});
  List<TransactionModel> get transfers => _transfers;
  bool isLoadingsendPay = true;
  late Paymentsend paymentsend;
  late PaymentsendResponse _paymentsendResponse;
  PaymentsendResponse get paymentsendResponse => _paymentsendResponse;

  Future<void> load() async {
    _transfers = await TransactionService.getTransactions(userId);
    isLoading = false;
    notifyListeners();
  }

  Future<void> add(TransactionModel tx) async {
    await TransactionService.createTransaction(userId, tx);
    _transfers.add(tx);
    notifyListeners();
  }

  Future<void> delete(String id) async {
    await TransactionService.deleteTransaction(id);
    _transfers.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  Future<void> update(TransactionModel tx) async {
    await TransactionService.updateTransaction(tx);
    final index = _transfers.indexWhere((c) => c.id == tx.id);
    if (index != -1) {
      _transfers[index] = tx;
      notifyListeners();
    }
  }

  Future<PaymentsendResponse?> send(Paymentsend py) async {
    try {
      paymentsend = py;
      _paymentsendResponse = await OpenPaymentsService.sendPay(py);

      isLoadingsendPay = false;
      notifyListeners();
      return _paymentsendResponse;
    } catch (e) {
      debugPrint("Error en send: $e");
      isLoadingsendPay = false;
      notifyListeners();
      return null;
    }
  }

  Future<void> completedPlay() async {
    try {
      await OpenPaymentsService.completePay(_paymentsendResponse);
      isLoadingsendPay = false;
      final tx = TransactionModel(
        uid: userId,
        type: 'out',
        name: 'Pago de renta',
        concepto: 'Pago mensual de habitación',
        count: double.parse(paymentsend.amount),
        date: DateTime.now().toIso8601String(),
      );
      add(tx);
    } catch (e) {
      debugPrint("Error en send: $e");
      isLoadingsendPay = false;
      notifyListeners();
    }
  }
}
