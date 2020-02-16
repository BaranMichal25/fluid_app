import 'package:fluid_app/rotating.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Rotating(
      child: Scaffold(
        appBar: AppBar(title: Text('Fluid App')),
        body: Center(
          child: Container(
            color: const Color(0xFFE8581C),
            child: const Text('Apartment for rent!'),
          ),
        ),
      ),
    );
  }
}
