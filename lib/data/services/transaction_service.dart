import 'package:alquiler_app/domain/entities/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Obtener todas las transacciones de un usuario
  static Future<List<TransactionModel>> getTransactions(String userId) async {
    final querySnapshot = await _db
        .collection('transactions')
        .where('uid', isEqualTo: userId) // filtra por usuario
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return TransactionModel(
        id: doc.id,
        uid: data['uid'] ?? '',
        type: data['type'] ?? '',
        name: data['name'] ?? '',
        concepto: data['concepto'] ?? '',
        count: (data['count'] is int)
            ? (data['count'] as int).toDouble()
            : (data['count'] ?? 0.0),
        date: data['date'] ?? '',
      );
    }).toList();
  }

  /// Crear nueva transacción
  static Future<void> createTransaction(
    String userId,
    TransactionModel tx,
  ) async {
    final docRef = _db
        .collection('transactions')
        .doc(); // genera el id pero no guarda aún
    await _db.collection('transactions').add({
      'id': docRef.id,
      'uid': userId,
      'type': tx.type,
      'name': tx.name,
      'concepto': tx.concepto,
      'count': tx.count,
      'date': tx.date,
    });
  }

  /// Actualizar transacción
  static Future<void> updateTransaction(TransactionModel tx) async {
    await _db.collection('transactions').doc(tx.id).update({
      'uid': tx.uid,
      'type': tx.type,
      'name': tx.name,
      'concepto': tx.concepto,
      'count': tx.count,
      'date': tx.date,
    });
  }

  /// Eliminar transacción
  static Future<void> deleteTransaction(String id) async {
    await _db.collection('transactions').doc(id).delete();
  }
}
