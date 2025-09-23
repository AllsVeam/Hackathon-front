// domain/entities/account.dart
class Account {
  final String? id; // id interno de la cuenta (puede ser local)
  final String? docId; // id del documento en Firestore
  final String? uid; // id del usuario dueño de la cuenta
  final String publicName;
  final String assetCode;
  final int assetScale;
  final String authServer;
  final String resourceServer;

  Account({
    this.id,
    this.docId,
    this.uid,
    required this.publicName,
    required this.assetCode,
    required this.assetScale,
    required this.authServer,
    required this.resourceServer,
  });

  /// Crear una copia con algunos campos modificados
  Account copyWith({
    String? id,
    String? docId,
    String? uid,
    String? publicName,
    String? assetCode,
    int? assetScale,
    String? authServer,
    String? resourceServer,
  }) {
    return Account(
      id: id ?? this.id,
      docId: docId ?? this.docId,
      uid: uid ?? this.uid,
      publicName: publicName ?? this.publicName,
      assetCode: assetCode ?? this.assetCode,
      assetScale: assetScale ?? this.assetScale,
      authServer: authServer ?? this.authServer,
      resourceServer: resourceServer ?? this.resourceServer,
    );
  }

  /// Convertir a mapa para Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'publicName': publicName,
      'assetCode': assetCode,
      'assetScale': assetScale,
      'authServer': authServer,
      'resourceServer': resourceServer,
    };
  }

  /// Crear desde mapa de Firebase
  factory Account.fromMap(Map<String, dynamic> map, {String? docId}) {
    return Account(
      docId: docId, // ID del documento en Firestore
      id: map['id'],
      uid: map['uid'] as String?,
      publicName: map['publicName'] ?? '',
      assetCode: map['assetCode'] ?? '',
      assetScale: map['assetScale'] ?? 0,
      authServer: map['authServer'] ?? '',
      resourceServer: map['resourceServer'] ?? '',
    );
  }
}
