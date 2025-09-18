import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _Card();
  }
}

class _Card extends StatefulWidget {
  const _Card();

  @override
  State<_Card> createState() => _CardState();
}

bool state = false;

class _CardState extends State<_Card> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final styleTextTitle = TextStyle(color: Colors.white, fontSize: 10);
    final styleTextAcount = TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );

    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.totalBalance, style: styleTextTitle),
                IconButton(
                  iconSize: 15,
                  onPressed: () => {
                    setState(() {
                      state = !state;
                    }),
                  },
                  icon: Icon(
                    state ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(state ? '••••••••' : '\$12,5000.50', style: styleTextAcount),
            Text(loc.availableBalance, style: styleTextTitle),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
