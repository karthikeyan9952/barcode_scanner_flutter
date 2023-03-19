import 'package:barcode_scanner/main.dart';
import 'package:barcode_scanner/providers/barcode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(child: Consumer<BarcodeProvider>(
        builder: (context, barcode, child) {
          return ListView(children: [
            DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  color: primary,
                  child: const Text(
                    "Barcode & QRcode Scanner",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )),
            ListTile(
              leading: Icon(Icons.volume_up, color: primary),
              title: const Text("Sound", style: TextStyle(fontSize: 16)),
              trailing: Switch(
                  value: !barcode.isMuted,
                  onChanged: (value) => barcode.toggleSound()),
            ),
            ListTile(
              leading: Icon(Icons.vibration, color: primary),
              title: const Text("Vibration", style: TextStyle(fontSize: 16)),
              trailing: Switch(
                  value: !barcode.isVibrateOff,
                  onChanged: (value) => barcode.toggleVibration()),
            ),
          ]);
        },
      )),
    );
  }
}
