import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/locale_provider.dart';
import 'package:alquiler_app/presentation/providers/theme/theme_provider.dart';
import 'package:alquiler_app/presentation/providers/transaction_provider.dart';
import 'package:alquiler_app/presentation/screens/home/widgets/quick_actions_widget.dart';
import 'package:alquiler_app/presentation/screens/home/widgets/transactions_card_widget.dart';
import 'package:alquiler_app/presentation/widgets/transactions_list_widget.dart';
import 'package:alquiler_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:alquiler_app/presentation/widgets/icon_bottom_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final transaction = Provider.of<TransactionProvider>(context);
    transaction.load();

    // HACK: si es necesario condicionar un elemento por medio del color del tema
    //final bool light = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${loc.home_welcome}, Alan Vega',
              style: TextStyle(
                fontSize: size.width * .050,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            Text(
              loc.home_lema,
              style: TextStyle(
                fontSize: size.width * .035,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ],
        ),
        actions: [
          iconButtonApp(
            icon: Icons.notifications,
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
          DropdownButton<Locale>(
            value: Provider.of<LocaleProvider>(context).locale,
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Theme.of(context).primaryColorLight,
            ),
            items: L10n.supportedLocales.map((locale) {
              final flag = locale.languageCode == 'en' ? '🇺🇸' : '🇪🇸';
              return DropdownMenuItem(value: locale, child: Text(flag));
            }).toList(),
            onChanged: (locale) {
              Provider.of<LocaleProvider>(
                context,
                listen: false,
              ).setLocale(locale!);
            },
          ),
          // TODO: boton difinido solo para cambiar entre dark y ligth, realizar funcion para agregar system
          /*
          iconButtonApp(
            icon: light ? Icons.brightness_2_rounded : Icons.brightness_high,
            color: light ? Colors.black : Colors.white,
            onPressed: () {
              final newMode = light ? ThemeMode.light : ThemeMode.dark;
              themeProvider.toggleTheme(newMode);
            },
          ),*/
          iconButtonApp(
            icon: () {
              final ThemeMode mode = themeProvider.themeMode;
              if (mode == ThemeMode.light) {
                return Icons.brightness_high;
              } else if (mode == ThemeMode.dark) {
                return Icons.brightness_2_rounded;
              } else {
                return Icons.brightness_auto;
              }
            }(),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              themeProvider.toggleNextTheme();
            },
          ),
        ],
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TransactionsCardWidget(),
            //TotalBalanceWidget(),
            QuickActionsWidget(),
            Expanded(child: TransactionsList(total: 10)),
          ],
        ),
      ),
    );
  }
}
