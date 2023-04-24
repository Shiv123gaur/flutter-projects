import 'package:biometrics/provider/db_provider.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;
  @override
  void initState(){
    LocalDb().getStatus().then((value) {
      setState(() {
        status = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListTile(
        title: Text("Enable fingerprint"),
        subtitle: Text("Fingerprint for more security"),
        trailing: Switch(
          value: status,
          onChanged: (value) {
            setState(() {
              status = value;
            });
            LocalDb().setStatus(value);
          },
        ),
      ),
    );
  }
}
