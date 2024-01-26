import 'package:flutter/material.dart';
class CenterDisplay extends StatelessWidget {
  const CenterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/test.png'),
          fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}