import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  // Estado para el DropdownButton de la cuenta
  String? _selectedAccount;
  final List<String> _accounts = ['Ahorro', 'Cuenta Dólares', 'Cuenta Viajes'];

  // Estado para el DropdownButton de la dirección de billetera
  String? _selectedWalletAddress;
  final List<String> _walletAddresses = ['0x123...', '0xabc...', '0xdef...'];

  // Estado para el Switch
  bool _isReceiving = false;

  // Colores del diseño
  final Color _backgroundColor = const Color.fromARGB(255, 24, 23, 24); // Morado oscuro
  final Color _inputBorderColor = const Color(0xFF00FFFF); // Cian
  final Color _labelTextColor = const Color(0xFF00FFFF); // Cian
  final Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
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
            // Sección de balance total
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                '--- ---', // Placeholder del balance
                style: TextStyle(
                  color: _labelTextColor,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Sección FROM
            Text(
              'from',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildLabeledDropdown(
              label: 'Account *',
              hintText: 'Select account...',
              value: _selectedAccount,
              items: _accounts,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAccount = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildLabeledDropdown(
              label: 'Wallet address *',
              hintText: 'Select wallet address...',
              value: _selectedWalletAddress,
              items: _walletAddresses,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWalletAddress = newValue;
                });
              },
            ),
            const SizedBox(height: 30),

            // Sección TO
            Text(
              'to',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildLabeledTextField(
              label: 'Wallet address or Incoming payment URL *',
              hintText: '',
            ),
            const SizedBox(height: 20),

            // Sección Amount
            Text(
              'Amount *',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildAmountInput(),
            const SizedBox(height: 20),

            // Sección Description
            Text(
              'Description',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildLabeledTextField(
              label: '',
              hintText: '',
              isMultiline: true,
            ),
            const SizedBox(height: 40),

            // Botón de acción
            _buildActionButton(context),
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
        Text(
          label,
          style: TextStyle(color: _textColor, fontSize: 16),
        ),
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
              hint: Text(hintText, style: TextStyle(color: _textColor.withOpacity(0.6))),
              dropdownColor: _backgroundColor,
              style: TextStyle(color: _textColor, fontSize: 16),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledTextField({
    required String label,
    required String hintText,
    bool isMultiline = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: TextStyle(color: _textColor, fontSize: 16),
          ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _inputBorderColor, width: 2),
          ),
          child: TextField(
            maxLines: isMultiline ? 4 : 1,
            style: TextStyle(color: _textColor),
            cursorColor: _textColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: hintText,
              hintStyle: TextStyle(color: _textColor.withOpacity(0.6)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _inputBorderColor, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text('send', style: TextStyle(color: _textColor)),
                Switch(
                  value: _isReceiving,
                  onChanged: (bool value) {
                    setState(() {
                      _isReceiving = value;
                    });
                  },
                  activeColor: _inputBorderColor,
                  inactiveTrackColor: Colors.grey,
                ),
                Text('receive', style: TextStyle(color: _textColor)),
                const SizedBox(width: 5),
                Icon(
                  Icons.info_outline,
                  color: _textColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE91E63), // Un color similar al del botón de la imagen
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Lógica para revisar el pago
        },
        child: Text(
          'Review Payment',
          style: TextStyle(color: _textColor, fontSize: 18),
        ),
      ),
    );
  }
}