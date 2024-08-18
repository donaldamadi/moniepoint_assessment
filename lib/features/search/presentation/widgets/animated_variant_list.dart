import 'package:flutter/material.dart';

/// Widget for the animated variant list floating button.
class AnimatedVariantListFloatingButton extends StatelessWidget {
  final Animation<double> opacityAnimation;

  const AnimatedVariantListFloatingButton({
    super.key,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnimation,
      builder: (context, child) {
        return Positioned(
          right: 20.0,
          bottom: 160.0,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.list, color: Colors.white),
                  SizedBox(width: 5.0),
                  Text('List of variants', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
