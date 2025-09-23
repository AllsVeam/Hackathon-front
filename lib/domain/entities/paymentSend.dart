class Paymentsend {
  final String senderWalletAddressUrl; // dirección de la wallet que envía
  final String receiverWalletAddressUrl; // dirección de la wallet que recibe
  final String amount; // monto (string porque en open payments se maneja así)

  Paymentsend({
    required this.senderWalletAddressUrl,
    required this.receiverWalletAddressUrl,
    required this.amount,
  });

  /// 🔹 Convertir modelo a Map (para Firebase)
  Map<String, dynamic> toMap() {
    return {
      'senderWalletAddressUrl': senderWalletAddressUrl,
      'receiverWalletAddressUrl': receiverWalletAddressUrl,
      'amount': amount,
    };
  }

  /// 🔹 Crear modelo desde un Map (ej: snapshot de Firebase)
  factory Paymentsend.fromMap(Map<String, dynamic> map) {
    return Paymentsend(
      senderWalletAddressUrl: map['senderWalletAddressUrl'] ?? '',
      receiverWalletAddressUrl: map['receiverWalletAddressUrl'] ?? '',
      amount: map['amount'] ?? '0',
    );
  }

  /// 🔹 Copiar con cambios
  Paymentsend copyWith({
    String? senderWalletAddressUrl,
    String? receiverWalletAddressUrl,
    String? amount,
  }) {
    return Paymentsend(
      senderWalletAddressUrl:
          senderWalletAddressUrl ?? this.senderWalletAddressUrl,
      receiverWalletAddressUrl:
          receiverWalletAddressUrl ?? this.receiverWalletAddressUrl,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() {
    return 'Paymentsend(senderWalletAddressUrl: $senderWalletAddressUrl, receiverWalletAddressUrl: $receiverWalletAddressUrl, amount: $amount)';
  }
}
