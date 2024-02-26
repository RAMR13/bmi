import 'package:flutter/material.dart';

class ReCard extends StatelessWidget {
  const ReCard({
    super.key,
    required this.c,
    this.cardChild,
    this.ontaps,
  });

  final VoidCallback? ontaps;
  final cardChild;
  final Color c;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontaps,
      child: Container(
        margin: EdgeInsets.all(10),
        child: cardChild,
        decoration: BoxDecoration(
            color: c, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
