import 'package:ecommerce/widgets/appIcon.dart';
import 'package:flutter/material.dart';

class Trial extends StatelessWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppIcon(iconbackground: Icons.circle,icontop: Icons.shopping_cart,)
    );
  }
}
