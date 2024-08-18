import 'package:flutter/material.dart';

/// Widget for a floating action button item.
class FloatingActionButtonItem extends StatelessWidget {
  final IconData icon;

  const FloatingActionButtonItem({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}