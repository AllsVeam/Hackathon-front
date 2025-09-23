import 'package:alquiler_app/data/services/account_service.dart';
import 'package:alquiler_app/data/services/open_payments/open_payments_service.dart';
import 'package:alquiler_app/domain/entities/account.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  String uid;
  AccountProvider({required this.uid});

  List<Account> _accounts = [];
  List<Account> get accounts => _accounts;

  Future<void> load() async {
    _accounts = await AccountService.getAccounts(uid);
    notifyListeners();
  }

  Future<void> add(Account account) async {
    await AccountService.addAccount(account.copyWith(uid: uid));
    await load();
  }

  Future<void> delete(String docId) async {
    await AccountService.deleteAccount(docId);
    await load();
  }

  Future<void> update(String docId, Account account) async {
    await AccountService.updateAccount(docId, account.copyWith(uid: uid));
    await load();
  }

  Future<String> search(String wa) async {
    try {
      final account = await OpenPaymentsService.searchWallet(
        "https://ilp.interledger-test.dev/$wa",
      );

      await add(account);
      return "Cuenta agregada correctamente";
    } catch (e) {
      return "No existe la wallet o hubo un error: $e";
    }
  }

  void updateUid(String newUid) {
    uid = newUid;
    load(); // recarga las cuentas del usuario
  }
}
