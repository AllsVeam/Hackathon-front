import 'dart:convert';

import 'package:alquiler_app/domain/entities/paymentSend.dart';
import 'package:alquiler_app/domain/entities/paymentSendResponse.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
class OpenPaymentsService {
static const String _baseUrl = "http://192.168.100.180:3000/api";

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

      Future<void> completedPlay(PaymentsendResponse pr) async {
          try {
            final serverResponse = await OpenPaymentsService.completePay(pr); 
            final quoteId = pr.quoteId;

            final paymentData = {
              'status': 'completed',
              'timestamp': FieldValue.serverTimestamp(),
              'paymentId': serverResponse['id'], 
              'paymentAmount': serverResponse['amount'],
            };
            
            await FirebaseFirestore.instance
                .collection('transacciones_finalizadas')
                .doc(quoteId) 
                .set(paymentData);
            
            print("Pago completado y datos guardados en Firebase con éxito.");
          } catch (e) {
            print("Error al completar el pago y/o al guardar en Firebase: $e");
          }
        }

static Future<Map<String, dynamic>> completePay(PaymentsendResponse pr) async {
  final url = Uri.parse("$_baseUrl/complete-pay");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(pr.toMap()),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data; // Devuelve los datos como un mapa
  } else {
    throw Exception(
      "Error al completar el pago. Código: ${response.statusCode}, Body: ${response.body}",
    );
  }
}
}
