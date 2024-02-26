import 'package:flutter/material.dart';

class cardchild extends StatelessWidget {
  const cardchild({
    super.key,
    required this.gen,
    this.ico,
  });
  final String gen;
  final IconData? ico;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        ico,
        color: Colors.white,
        size: 80,
      ),
      Text(
        gen,
        style: TextStyle(
            color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ]);
  }
}
