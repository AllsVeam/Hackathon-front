import 'package:alquiler_app/presentation/screens/cliente/claculadora/widgets/pay_now_button_widget.dart';
import 'package:alquiler_app/presentation/screens/home/send_money_screen.dart';
import 'package:flutter/material.dart';

class AddRoomieScreen extends StatefulWidget {
  const AddRoomieScreen({super.key});

  @override
  State<AddRoomieScreen> createState() => _AddRoomieScreenState();
}

class _AddRoomieScreenState extends State<AddRoomieScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _users = [
    {'name': 'Antonio Lopez', 'id': 'user1'},
    {'name': 'Andrea Guzman', 'id': 'user2'},
    {'name': 'Arturo Garcia', 'id': 'user3'},
  ];
  List<Map<String, String>> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
    _searchController.addListener(_filterUsers);
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        return user['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _inviteUser(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invitación enviada a $name')),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterUsers);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Roomie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Busca por nombre de usuario a tu próximo roomie e invítalo a compartir vivienda!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredUsers[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(user['name']!),
                      trailing: ElevatedButton(
                        onPressed: () => _inviteUser(user['name']!),
                        child: const Text('Invitar'),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 35),
            PayNowButtonWidget(
              label: 'Proceder al pago',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SendMoneyScreen()),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}
