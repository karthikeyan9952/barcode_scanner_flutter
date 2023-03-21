import 'package:barcode_scanner/main.dart';
import 'package:barcode_scanner/providers/barcode_provider.dart';
import 'package:barcode_scanner/utils/keys.dart';
import 'package:barcode_scanner/widgets/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BarcodeProvider>(builder: (context, barcode, child) {
      return Scaffold(
        key: mainKey,
        drawer: const DrawerMain(),
        appBar: AppBar(
          title: const Text("Barcode & QRcode Scanner"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => barcode.scanBarcodeNormal(),
            label: Row(
              children: const [
                Icon(Icons.qr_code),
                SizedBox(width: 6),
                Text(
                  "Scan",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scanned Code",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 108),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primary)),
              child: SelectableText(barcode.barcodeScanRes,
                  style: const TextStyle(fontSize: 16)),
            )
          ],
        )),
      );
    });
  }
}
