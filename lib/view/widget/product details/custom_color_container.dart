import 'package:flutter/material.dart';

class CustomColor extends StatelessWidget {
  final Color color;
  final String colorName;
  final bool selected;
  const CustomColor({
    super.key,
    required this.color,
    required this.colorName,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color,
        child: Center(
          child: selected == true
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                )
              : Text(
                  colorName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
