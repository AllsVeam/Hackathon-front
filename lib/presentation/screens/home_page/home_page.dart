import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/providers/transaction_provider.dart';
import 'package:alquiler_app/presentation/screens/home/home_screen.dart';
import 'package:alquiler_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:alquiler_app/presentation/screens/home/properties_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return ChangeNotifierProvider(
      create: (_) => TransactionProvider(userId: user.uid)..loadCards(),
      child: const BottomNavigationBarApp(),
    );
  }
}

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PropertiesScreen(),
    const _ViewExample(title: 'Calculadora'),
    ProfileScreen(
      actions: [
        SignedOutAction((context) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            (route) => false, // elimina toda la pila de navegación
          );
        }),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: loc.page_home,
            //backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: loc.page_dwelling,
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: loc.page_calculator,
            //backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: loc.page_profile,
            //backgroundColor: bgColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: Colors.grey, // Íconos no seleccionados en gris
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _ViewExample extends StatelessWidget {
  final String title;
  const _ViewExample({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Text('Contenido de $title', style: TextStyle(fontSize: 50)),
    );
  }
}
