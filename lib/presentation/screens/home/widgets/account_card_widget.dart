import 'package:alquiler_app/presentation/widgets/icon_bottom_app.dart';
import 'package:flutter/material.dart';
//import 'package:alquiler_app/models/account_model.dart';
//import 'package:alquiler_app/services/api_service.dart';

class _SingleAccountCard extends StatelessWidget {
  final String accountName;
  final String currencyCode;
  final String balance;

  const _SingleAccountCard({
    required this.accountName,
    required this.currencyCode,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    Color cardBackgroundColor = Color(0xFF4C0099);

    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Theme.of(context).cardColor, width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la cuenta
            Text(
              accountName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Chip de la moneda
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                currencyCode,
                style: TextStyle(
                  color: cardBackgroundColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            // Balance
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$currencyCode$balance',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountCardWidget extends StatefulWidget {
  final bool useApi;

  const AccountCardWidget({super.key, this.useApi = false});

  @override
  State<AccountCardWidget> createState() => _AccountCardWidgetState();
}

class _AccountCardWidgetState extends State<AccountCardWidget> {
  late Future<List<Map<String, String>>> _futureAccountData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    if (widget.useApi) {
      _futureAccountData = _fetchDataFromApi();
    } else {
      _futureAccountData = Future.value(_harcodedData);
    }
  }

  Future<List<Map<String, String>>> _fetchDataFromApi() async {
    // Lógica simulada de la API
    return Future.delayed(const Duration(seconds: 2), () {
      final List<Map<String, String>> data = [
        {
          'name': 'Cuenta Principal',
          'currencyCode': 'MX\$',
          'balance': '9,999,999.99',
        },
      ];
      return data;
    });
  }

  final List<Map<String, String>> _harcodedData = [
    {
      'name': 'Cuenta Ahorro',
      'currencyCode': 'MX\$',
      'balance': '9,999,999.99',
    },
    {'name': 'Cuenta Dólares', 'currencyCode': 'USD', 'balance': '50,000.00'},
    {'name': 'Cuenta Viajes', 'currencyCode': 'EUR', 'balance': '1,200.50'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Cuentas',
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),

        actions: [
          iconButtonApp(
            icon: Icons.notifications,
            color: Theme.of(context).primaryColorLight,
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _futureAccountData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: snapshot.data!.map((data) {
                  // Proporciona un valor por defecto si la clave 'name' es nula
                  final accountName = data['name'] ?? 'Nombre no disponible';
                  final currencyCode = data['currencyCode'] ?? '';
                  final balance = data['balance'] ?? '0.00';

                  return _SingleAccountCard(
                    accountName: accountName,
                    currencyCode: currencyCode,
                    balance: balance,
                  );
                }).toList(),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No hay datos disponibles.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
