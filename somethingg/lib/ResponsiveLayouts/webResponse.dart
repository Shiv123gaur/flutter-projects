import 'package:flutter/material.dart';
import 'package:somethingg/Models/users.dart' as model;
import 'package:provider/provider.dart';

import '../Providers/user_provider.dart';


class WebResponse extends StatelessWidget {
  const WebResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return MaterialApp(
        home: Center(
            child: Text(
        user.url,
      style: TextStyle(color: Colors.black, fontSize: 100),
    )));
  }
}
