import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alquiler_app/presentation/providers/account_provider.dart';
import 'package:alquiler_app/presentation/widgets/icon_bottom_app.dart';
import 'package:alquiler_app/domain/entities/account.dart';

class _SingleAccountCard extends StatelessWidget {
  final Account account;

  const _SingleAccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    Color cardBackgroundColor = Color(0xFF4C0099);

    return GestureDetector(
      onLongPress: () async {
        // Mostrar cuadro de confirmación
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Eliminar cuenta'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar esta cuenta?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Eliminar'),
              ),
            ],
          ),
        );

        if (confirmed ?? false) {
          final provider = Provider.of<AccountProvider>(context, listen: false);
          await provider.delete(account.docId!);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Cuenta eliminada')));
        }
      },
      child: Container(
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
              // Nombre de la cuenta
              Text(
                account.publicName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Chip de moneda
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  account.assetCode,
                  style: TextStyle(
                    color: cardBackgroundColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              // ID
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  account.id ?? 'Sin ID',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({super.key});

  void _showSearchPopup(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buscar Wallet'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Ingresa la wallet'),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                final provider = Provider.of<AccountProvider>(
                  context,
                  listen: false,
                );
                final msg = await provider.search(value);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(msg)));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Buscar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

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
            icon: Icons.add,
            color: Theme.of(context).primaryColorLight,
            onPressed: () => _showSearchPopup(context),
          ),
        ],
      ),
      body: Consumer<AccountProvider>(
        builder: (context, provider, _) {
          final accounts = provider.accounts;

          if (accounts.isEmpty) {
            return const Center(child: Text('No hay cuentas disponibles'));
          }

          return ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              return _SingleAccountCard(account: account);
            },
          );
        },
      ),
    );
  }
}
