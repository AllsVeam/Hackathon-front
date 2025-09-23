import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/account_provider.dart';
import 'package:alquiler_app/presentation/providers/transaction_provider.dart';
import 'package:alquiler_app/presentation/screens/home/accounts_screen.dart';
import 'package:alquiler_app/presentation/screens/home/request_money_screen.dart';
import 'package:alquiler_app/presentation/screens/home/send_money_screen.dart';
import 'package:alquiler_app/presentation/screens/transactions/transactions_screen.dart';
import 'package:alquiler_app/presentation/widgets/icon_bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                loc.quickActions,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          _QuickActionsBuild(),
          _RecentTransaction(),
        ],
      ),
    );
  }
}

class _QuickActionsBuild extends StatelessWidget {
  const _QuickActionsBuild();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final transactions = Provider.of<TransactionProvider>(context);
    final account = Provider.of<AccountProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconBottomAction(
          backgroundColor: Theme.of(context).cardColor,
          Icons.wallet,
          loc.home_accounts,
          Colors.purpleAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                  value: account,
                  child: const AccountsScreen(),
                ),
              ),
            );
          },
        ),
        iconBottomAction(
          backgroundColor: Theme.of(context).cardColor,
          Icons.near_me,
          loc.send,
          Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                  value: transactions,
                  child: const SendMoneyScreen(),
                ),
              ),
            );
          },
        ),
        iconBottomAction(
          backgroundColor: Theme.of(context).cardColor,
          Icons.vertical_align_bottom,
          loc.receive,
          Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestMoneyScreen()),
            );
          },
        ),
      ],
    );
  }
}

// HACK: Este widget solo es utilizado para que los botones direccionen a una vista provisional
class ActionScreen extends StatelessWidget {
  final String actionScreenTitle;
  const ActionScreen({super.key, required this.actionScreenTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(actionScreenTitle)),
      body: Center(child: Text(actionScreenTitle)),
    );
  }
}

class _RecentTransaction extends StatelessWidget {
  const _RecentTransaction();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              loc.recentTransaction,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                final txProvider = Provider.of<TransactionProvider>(
                  context,
                  listen: false,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: txProvider,
                      child: const TransactionsScreen(),
                    ),
                  ),
                );
              },
              child: Text(
                loc.seeAll,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
