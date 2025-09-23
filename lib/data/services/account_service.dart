import 'package:alquiler_app/domain/entities/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Obtener todas las cuentas de un usuario (filtra por uid)
  static Future<List<Account>> getAccounts(String uid) async {
    final snapshot = await _db
        .collection('accounts')
        .where('uid', isEqualTo: uid)
        .get();

    return snapshot.docs
        .map((doc) => Account.fromMap(doc.data(), docId: doc.id))
        .toList();
  }

  /// Agregar una nueva cuenta
  static Future<String> addAccount(Account account) async {
    final docRef = await _db.collection('accounts').add(account.toMap());
    return docRef.id; // retornamos el documentId
  }

  /// Eliminar cuenta por documentId
  static Future<void> deleteAccount(String docId) async {
    await _db.collection('accounts').doc(docId).delete();
  }

  /// Actualizar cuenta por documentId
  static Future<void> updateAccount(String docId, Account account) async {
    await _db.collection('accounts').doc(docId).update(account.toMap());
  }
}
