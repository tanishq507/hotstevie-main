import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.brown,
        ),
        child: const Icon(Icons.menu),
      ),
    );
  }
}
