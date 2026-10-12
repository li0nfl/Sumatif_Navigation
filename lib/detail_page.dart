import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String selectedVoucher = 'Belum ada voucher diklaim';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> gadget =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String namaGadget = gadget['name'] as String;
    final String hargaGadget = gadget['price'] as String;
    final IconData iconGadget = gadget['icon'] as IconData;

    return Scaffold(
      appBar: AppBar(title: Text('Detail Gadget $namaGadget')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(iconGadget, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              namaGadget,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp $hargaGadget',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 30),
            const Text(
              'Voucher Dipilih:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer, color: Colors.amber),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      selectedVoucher,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/voucher');

                if (result != null && result is String) {
                  setState(() {
                    selectedVoucher = result;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Klaim Voucher Diskon',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
