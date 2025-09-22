import 'package:alquiler_app/data/services/transaction_service.dart';
import 'package:alquiler_app/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  final String userId;
  bool isLoading = true;
  List<TransactionModel> _transfers = [];
  TransactionProvider({required this.userId});
  List<TransactionModel> get transfers => _transfers;

  Future<void> loadCards() async {
    _transfers = await TransactionService.getTransactions(userId);
    isLoading = false;
    notifyListeners();
  }

  Future<void> addCard(TransactionModel tx) async {
    await TransactionService.createTransaction(userId, tx);
    _transfers.add(tx);
    notifyListeners();
  }

  Future<void> deleteCard(String id) async {
    await TransactionService.deleteTransaction(id);
    _transfers.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  Future<void> updateCard(TransactionModel tx) async {
    await TransactionService.updateTransaction(tx);
    final index = _transfers.indexWhere((c) => c.id == tx.id);
    if (index != -1) {
      _transfers[index] = tx;
      notifyListeners();
    }
  }
}
