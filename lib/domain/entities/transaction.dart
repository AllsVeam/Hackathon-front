class TransactionModel {
  final String? id; // id del documento en Firestore (puede ser null al crear)
  final String uid; // id del usuario dueño de la transacción
  final String type; // tipo: ingreso, gasto, etc.
  final String name; // nombre de la transacción
  final String concepto; // detalle o concepto
  final double count; // monto
  final String date; // fecha (puede ser String o Timestamp formateado)

  TransactionModel({
    this.id, // <- opcional
    required this.uid,
    required this.type,
    required this.name,
    required this.concepto,
    required this.count,
    required this.date,
  });

  /// 🔹 Convertir modelo a Map (para Firebase)
  Map<String, dynamic> toMap() {
    return {
      'id': id, // puede ser null al inicio
      'uid': uid,
      'type': type,
      'name': name,
      'concepto': concepto,
      'count': count,
      'date': date,
    };
  }

  /// 🔹 Crear modelo desde un Map (ej: snapshot de Firebase)
  factory TransactionModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return TransactionModel(
      id: documentId, // el ID del documento en Firestore
      uid: map['uid'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      concepto: map['concepto'] ?? '',
      count: (map['count'] ?? 0).toDouble(),
      date: map['date'] ?? '',
    );
  }

  /// 🔹 Copiar con cambios
  TransactionModel copyWith({
    String? id,
    String? uid,
    String? type,
    String? name,
    String? concepto,
    double? count,
    String? date,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      name: name ?? this.name,
      concepto: concepto ?? this.concepto,
      count: count ?? this.count,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, uid: $uid, type: $type, name: $name, concepto: $concepto, count: $count, date: $date)';
  }
}
