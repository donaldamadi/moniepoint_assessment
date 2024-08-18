import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/features/search/presentation/widgets/floating_action_button_item.dart';

/// Widget for the animated floating buttons on the map.
class AnimatedFloatingButtons extends StatelessWidget {
  final Animation<double> opacityAnimation;

  const AnimatedFloatingButtons({
    super.key,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnimation,
      builder: (context, child) {
        return Positioned(
          left: 20.0,
          bottom: 160.0,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Column(
              children: [
                const FloatingActionButtonItem(icon: Icons.work),
                const SizedBox(height: 10.0),
                PopupMenuButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  icon: const FloatingActionButtonItem(icon: Icons.filter_alt),
                  itemBuilder: (context) => <PopupMenuEntry<int>>[
                    const PopupMenuItem(
                      height: 25,
                      value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.security_rounded, size: 20.0),
                          SizedBox(width: 4),
                          Text("Cosy areas"),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 25,
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.wallet, size: 20.0),
                          SizedBox(width: 4),
                          Text("Price"),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 25,
                      value: 2,
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart, size: 20.0),
                          SizedBox(width: 4),
                          Text("Infrastructure"),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 25,
                      value: 3,
                      child: Row(
                        children: [
                          Icon(Icons.layers, size: 20.0),
                          SizedBox(width: 4),
                          Text("Without any layer"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
