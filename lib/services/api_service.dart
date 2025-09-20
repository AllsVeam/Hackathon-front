import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alquiler_app/models/account_model.dart'; // Asegúrate de que la ruta sea correcta

class ApiService {
  Future<AccountModel> fetchAccountData() async {
    final String accountId = '736c3f46-f11f-43c9-b5a5-d40f56b850e8';
    final String apiUrl =  '';  //'https://wallet.interledger-test.dev/_next/data/9NmBmmFUEMyl3bTE6GRZh/account/$accountId.json?accountId=$accountId';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Si la petición es exitosa (código 200), parseamos el JSON
      return accountModelFromJson(response.body);
    } else {
      // Si la petición falla, lanzamos una excepción
      throw Exception('Failed to load account data. Status code: ${response.statusCode}');
    }
  }
}