class allWallet {
  final bool success;
  final String message;
  final String? sendingWalletAddressId;
  final String? sendingWalletAddressPublicName;
  final String? sendingWalletAddressAssetCode;
  final int? sendingWalletAddressAssetScale;
  final String? sendingWalletAddressAuthServer;
  final String? sendingWalletAddressResourceServer;

  allWallet({
    required this.success,
    required this.message,
    this.sendingWalletAddressId,
    this.sendingWalletAddressPublicName,
    this.sendingWalletAddressAssetCode,
    this.sendingWalletAddressAssetScale,
    this.sendingWalletAddressAuthServer,
    this.sendingWalletAddressResourceServer,
  });

  factory allWallet.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic>? sendingWalletAddressMap = map['sendingWalletAddress'] as Map<String, dynamic>?;

    return allWallet(
      success: map['success'] as bool? ?? false,
      message: map['message'] as String? ?? '',
      sendingWalletAddressId: sendingWalletAddressMap?['id'] as String?,
      sendingWalletAddressPublicName: sendingWalletAddressMap?['publicName'] as String?,
      sendingWalletAddressAssetCode: sendingWalletAddressMap?['assetCode'] as String?,
      sendingWalletAddressAssetScale: sendingWalletAddressMap?['assetScale'] as int?,
      sendingWalletAddressAuthServer: sendingWalletAddressMap?['authServer'] as String?,
      sendingWalletAddressResourceServer: sendingWalletAddressMap?['resourceServer'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = {
      'success': success,
      'message': message,
    };
    if (sendingWalletAddressId != null) {
      result['sendingWalletAddress'] = {
        'id': sendingWalletAddressId,
        'publicName': sendingWalletAddressPublicName,
        'assetCode': sendingWalletAddressAssetCode,
        'assetScale': sendingWalletAddressAssetScale,
        'authServer': sendingWalletAddressAuthServer,
        'resourceServer': sendingWalletAddressResourceServer,
      };
    }
    return result;
  }
}