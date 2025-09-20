import 'package:alquiler_app/l10n/app_localizations.dart';
import 'package:alquiler_app/presentation/screens/home/home_screen.dart';
import 'package:alquiler_app/presentation/screens/home/properties_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarApp();
  }
}

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PropertiesScreen(),
    _ViewExample(title: 'Vivienda'),
    HomeScreen(),
    _ViewExample(title: 'Profile'),
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
