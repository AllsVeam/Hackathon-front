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
      'success': success,
      'redirectUrl': redirectUrl,
      'continueAccessToken': continueAccessToken,
      'continueUri': continueUri,
      'quoteId': quoteId,
      'sendingWalletAddressId': sendingWalletAddressId,
      'sendingWalletResourceServer': sendingWalletResourceServer,
    };
  }

  factory PaymentsendResponse.fromMap(Map<String, dynamic> map) {
    return PaymentsendResponse(
      success: map['success'] ?? false,
      redirectUrl: map['redirectUrl'] ?? '',
      continueAccessToken: map['continueAccessToken'] ?? '',
      continueUri: map['continueUri'] ?? '',
      quoteId: map['quoteId'] ?? '',
      sendingWalletAddressId: map['sendingWalletAddressId'] ?? '',
      sendingWalletResourceServer: map['sendingWalletResourceServer'] ?? '',
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
      sendingWalletAddressId:
          sendingWalletAddressId ?? this.sendingWalletAddressId,
      sendingWalletResourceServer:
          sendingWalletResourceServer ?? this.sendingWalletResourceServer,
    );
  }

  @override
  String toString() {
    return 'PaymentsendResponse(success: $success, redirectUrl: $redirectUrl, continueAccessToken: $continueAccessToken, continueUri: $continueUri, quoteId: $quoteId, sendingWalletAddressId: $sendingWalletAddressId, sendingWalletResourceServer: $sendingWalletResourceServer)';
  }
}
