import 'package:alquiler_app/domain/entities/paymentSend.dart';
import 'package:alquiler_app/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart'; // Importa este paquete para TapGestureRecognizer

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  // Sender fijo
  final String _senderWalletAddressUrl =
      'https://ilp.interledger-test.dev/prueba-mvr';

  // Receiver dinámico
  String? _receiverWalletAddress;
  final List<String> _walletAddresses = [
    'https://ilp.interledger-test.dev/8f22ad51',
  ];

  // Amount
  final TextEditingController _amountController = TextEditingController();

  // Colores
  final Color _backgroundColor = const Color.fromARGB(255, 24, 23, 24);
  final Color _inputBorderColor = const Color(0xFF00FFFF);
  final Color _labelTextColor = const Color(0xFF00FFFF);
  final Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money', style: TextStyle(color: Colors.white)),
        backgroundColor: _backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sender fijo
            Text(
              'From',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(_senderWalletAddressUrl, style: TextStyle(color: _textColor)),
            const SizedBox(height: 30),

            // Receiver
            Text('To', style: TextStyle(color: _labelTextColor, fontSize: 16)),
            const SizedBox(height: 10),
            _buildLabeledDropdown(
              label: 'Receiver Wallet Address *',
              hintText: 'Select receiver wallet address...',
              value: _receiverWalletAddress,
              items: _walletAddresses,
              onChanged: (String? newValue) {
                setState(() {
                  _receiverWalletAddress = newValue;
                });
              },
            ),
            const SizedBox(height: 30),

            // Amount
            Text(
              'Amount *',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: _inputBorderColor, width: 2),
              ),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: _textColor),
                cursorColor: _textColor,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: '0.00',
                  hintStyle: TextStyle(color: _textColor.withOpacity(0.6)),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Botón
            _buildActionButton(context, transactions),
          ],
        ),
      ),
    );
  }

  Widget _buildLabeledDropdown({
    required String label,
    required String hintText,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: _textColor, fontSize: 16)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _inputBorderColor, width: 2),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              hint: Text(
                hintText,
                style: TextStyle(color: _textColor.withOpacity(0.6)),
              ),
              dropdownColor: _backgroundColor,
              style: TextStyle(color: _textColor, fontSize: 16),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    TransactionProvider transactions,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE91E63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () async {
          if (_receiverWalletAddress != null &&
              _amountController.text.isNotEmpty) {
            // Mostrar loading full-screen
            showDialog(
              context: context,
              barrierDismissible: false, // No se puede cerrar tocando fuera
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );

            final body = Paymentsend(
              senderWalletAddressUrl: _senderWalletAddressUrl,
              receiverWalletAddressUrl: _receiverWalletAddress!,
              amount: _amountController.text,
            );

            final response = await transactions.send(body);

            Navigator.pop(context); // Cierra el loader

            if (response != null && response.redirectUrl.isNotEmpty) {
              _showRedirectDialog(
                "Confirm Payment",
                "Your payment request was created. Do you want to continue and authorize it?",
                [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await _launchUrl(response.redirectUrl);
                      _showRedirectDialog(
                        "Confirmar la transaccion",
                        "Lo veras reflejado en tu cuenta",
                        [
                          ElevatedButton(
                            onPressed: () async {
                              await transactions.completedPlay();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("Continue"),
                          ),
                        ],
                      );
                    },
                    child: const Text("Continue"),
                  ),
                ],
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Completa todos los campos")),
            );
          }
        },

        child: Text(
          'Review Payment',
          style: TextStyle(color: _textColor, fontSize: 18),
        ),
      ),
    );
  }

  void _showRedirectDialog(String title, String content, List<Widget> actions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      ),
    );
  }

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw 'No se pudo abrir la URL';
    }
  }
}
