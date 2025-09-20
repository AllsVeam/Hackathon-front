import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    final PageProps pageProps;
    final bool nSsp;

    AccountModel({
        required this.pageProps,
        required this.nSsp,
    });

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        pageProps: PageProps.fromJson(json["pageProps"]),
        nSsp: json["__N_SSP"],
    );

    Map<String, dynamic> toJson() => {
        "pageProps": pageProps.toJson(),
        "__N_SSP": nSsp,
    };
}

class PageProps {
    final Account account;
    final List<dynamic> walletAddresses;

    PageProps({
        required this.account,
        required this.walletAddresses,
    });

    factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
        account: Account.fromJson(json["account"]),
        walletAddresses: List<dynamic>.from(json["walletAddresses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "account": account.toJson(),
        "walletAddresses": List<dynamic>.from(walletAddresses.map((x) => x)),
    };
}

class Account {
    final String id;
    final String name;
    final String userId;
    final String assetId;
    final String assetCode;
    final int assetScale;
    final String balance;
    final String gateHubWalletId;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic cardId;
    final bool isFunded;
    final bool isHidden;

    Account({
        required this.id,
        required this.name,
        required this.userId,
        required this.assetId,
        required this.assetCode,
        required this.assetScale,
        required this.balance,
        required this.gateHubWalletId,
        required this.createdAt,
        required this.updatedAt,
        required this.cardId,
        required this.isFunded,
        required this.isHidden,
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        userId: json["userId"],
        assetId: json["assetId"],
        assetCode: json["assetCode"],
        assetScale: json["assetScale"],
        balance: json["balance"],
        gateHubWalletId: json["gateHubWalletId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cardId: json["cardId"],
        isFunded: json["isFunded"],
        isHidden: json["isHidden"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "userId": userId,
        "assetId": assetId,
        "assetCode": assetCode,
        "assetScale": assetScale,
        "balance": balance,
        "gateHubWalletId": gateHubWalletId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cardId": cardId,
        "isFunded": isFunded,
        "isHidden": isHidden,
    };
}