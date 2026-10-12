import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  final List<Map<String, dynamic>> gadgets = const [
    {
      'name': 'Smartphone Pro X',
      'price': '4.500.000',
      'icon': Icons.phone_android,
    },
    {'name': 'Laptop Ultra 14', 'price': '12.000.000', 'icon': Icons.laptop},
    {'name': 'Wireless Earbuds', 'price': '750.000', 'icon': Icons.headphones},
    {'name': 'Smartwatch Series 5', 'price': '1.500.000', 'icon': Icons.watch},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechExpress - Katalog'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: gadgets.length,
        itemBuilder: (context, index) {
          final gadget = gadgets[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: gadget);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  gadget['icon'] as IconData,
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(
                  gadget['name'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('Rp ${gadget['price']}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'katalog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
