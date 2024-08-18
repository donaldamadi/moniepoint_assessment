import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/constants/colors.dart';

/// Widget for the animated search bar at the top of the map.
class AnimatedSearchBar extends StatelessWidget {
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const AnimatedSearchBar({
    super.key,
    required this.positionAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: positionAnimation,
      builder: (context, child) {
        return Positioned(
          top: positionAnimation.value,
          left: 20.0,
          right: 20.0,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: const SearchBar(),
          ),
        );
      },
    );
  }
}

/// Widget for the search bar container.
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.7), // Adjust to match your design
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: 'Saint Petersburg',
              hintStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: AppColors.appBlack),
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Adjust to match your design
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.settings, color: AppColors.appBlack),
        ),
      ],
    );
  }
}
