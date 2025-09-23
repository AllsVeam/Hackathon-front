class PaymentsendResponse {
  final bool success;
  final String redirectUrl;
  final String continueAccessToken;
  final String continueUri;
  final String quoteId;
  final String sendingWalletAddressId;
  final String sendingWalletResourceServer;

  PaymentsendResponse({
    required this.success,
    required this.redirectUrl,
    required this.continueAccessToken,
    required this.continueUri,
    required this.quoteId,
    required this.sendingWalletAddressId,
    required this.sendingWalletResourceServer,
  });

  Map<String, dynamic> toMap() {
    return {
      'continueUri': continueUri,
      'accessToken': continueAccessToken,
      'quoteId': quoteId,
      'sendingWalletAddressId': sendingWalletAddressId,
      'sendingWalletResourceServer': sendingWalletResourceServer,
    };
  }

 factory PaymentsendResponse.fromMap(Map<String, dynamic> map) {
    return PaymentsendResponse(
      success: map['success'] as bool? ?? false,
      redirectUrl: map['redirectUrl'] as String? ?? '',
      continueAccessToken: map['continueAccessToken'] as String? ?? '',
      continueUri: map['continueUri'] as String? ?? '',
      quoteId: map['quoteId'] as String? ?? '',
      sendingWalletAddressId: map['sendingWalletAddressId'] as String? ?? '',
      sendingWalletResourceServer: map['sendingWalletResourceServer'] as String? ?? '',
    );
  }

  PaymentsendResponse copyWith({
    bool? success,
    String? redirectUrl,
    String? continueAccessToken,
    String? continueUri,
    String? quoteId,
    String? sendingWalletAddressId,
    String? sendingWalletResourceServer,
  }) {
    return PaymentsendResponse(
      success: success ?? this.success,
      redirectUrl: redirectUrl ?? this.redirectUrl,
      continueAccessToken: continueAccessToken ?? this.continueAccessToken,
      continueUri: continueUri ?? this.continueUri,
      quoteId: quoteId ?? this.quoteId,
      sendingWalletAddressId: sendingWalletAddressId ?? this.sendingWalletAddressId,
      sendingWalletResourceServer: sendingWalletResourceServer ?? this.sendingWalletResourceServer,
    );
  }

  // Método para obtener una representación en cadena de la instancia
  @override
  String toString() {
    return 'PaymentsendResponse(success: $success, redirectUrl: $redirectUrl, continueAccessToken: $continueAccessToken, continueUri: $continueUri, quoteId: $quoteId, sendingWalletAddressId: $sendingWalletAddressId, sendingWalletResourceServer: $sendingWalletResourceServer)';
  }
}
