import 'dart:convert';

import 'package:alquiler_app/domain/entities/paymentSend.dart';
import 'package:alquiler_app/domain/entities/paymentSendResponse.dart';
import 'package:http/http.dart' as http;

class OpenPaymentsService {
  static const String _baseUrl = "https://kcdgtprc-3000.usw3.devtunnels.ms/api";

  static Future<PaymentsendResponse> sendPay(Paymentsend py) async {
    final url = Uri.parse("$_baseUrl/start-pay");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(py.toMap()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PaymentsendResponse.fromMap(data);
    } else {
      throw Exception(
        "Error al iniciar el pago. Código: ${response.statusCode}, Body: ${response.body}",
      );
    }
  }

  static Future<String> completePay(PaymentsendResponse pr) async {
    final url = Uri.parse("$_baseUrl/complete-pay");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(pr.toMap()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return response.statusCode.toString();
    } else {
      throw Exception(
        "Error al completar el pago. Código: ${response.statusCode}, Body: ${response.body}",
      );
    }
  }
}
