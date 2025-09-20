import 'package:flutter/material.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({super.key});

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  // Estado para los DropdownButtons
  String? _selectedAccount;
  final List<String> _accounts = ['Ahorro', 'Cuenta Dólares', 'Cuenta Viajes'];

  String? _selectedWalletAddress;
  final List<String> _walletAddresses = ['0x123...', '0xabc...', '0xdef...'];
  
  String? _selectedTimeUnit;
  final List<String> _timeUnits = ['Días', 'Horas', 'Minutos'];

  // Colores del diseño
  final Color _backgroundColor = const Color.fromARGB(255, 30, 30, 31); // Morado oscuro
  final Color _inputBorderColor = const Color(0xFF00FFFF); // Cian
  final Color _labelTextColor = const Color(0xFF00FFFF); // Cian
  final Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar dinero', style: TextStyle(color: Colors.white)),
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
                'Saldo total',
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

            // Sección de cuenta
            Text(
              'en',
              style: TextStyle(color: _labelTextColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            _buildLabeledDropdown(
              label: 'Cuenta *',
              hintText: 'Seleccionar cuenta...',
              value: _selectedAccount,
              items: _accounts,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAccount = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Sección de dirección de billetera
            _buildLabeledDropdown(
              label: 'Dirección de billetera *',
              hintText: 'Seleccione la dirección de la billetera...',
              value: _selectedWalletAddress,
              items: _walletAddresses,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWalletAddress = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            
            // Sección de Cantidad
            _buildLabeledTextField(
              label: 'Cantidad *',
              hintText: '0.00',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Sección de Descripción
            _buildLabeledTextField(
              label: 'Descripción',
              hintText: '',
              isMultiline: true,
            ),
            const SizedBox(height: 20),

            // Sección de Expiración
            Text(
              'Expiración',
              style: TextStyle(color: _textColor, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildLabeledTextField(
                    label: '',
                    hintText: 'Cantidad de tiempo',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: _buildLabeledDropdown(
                    label: '',
                    hintText: 'Unidad',
                    value: _selectedTimeUnit,
                    items: _timeUnits,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTimeUnit = newValue;
                      });
                    },
                  ),
                ),
              ],
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
        if (label.isNotEmpty) ...[
          Text(label, style: TextStyle(color: _textColor, fontSize: 16)),
          const SizedBox(height: 8),
        ],
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
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: TextStyle(color: _textColor, fontSize: 16)),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _inputBorderColor, width: 2),
          ),
          child: TextField(
            keyboardType: keyboardType,
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
          // Lógica para realizar la solicitud
        },
        child: Text(
          'Pedido',
          style: TextStyle(color: _textColor, fontSize: 18),
        ),
      ),
    );
  }
}