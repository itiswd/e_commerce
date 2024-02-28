import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: Image.asset(
        'assets/images/shopping-cart.png',
        width: 150,
        height: 150,
      ),
    );
  }
}
