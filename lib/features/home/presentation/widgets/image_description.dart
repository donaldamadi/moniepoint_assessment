import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_assessment/constants/colors.dart';

class AnimatedDescriptionWidget extends StatefulWidget {
  final String address;
  final VoidCallback onPressed;

  const AnimatedDescriptionWidget({
    super.key,
    required this.address,
    required this.onPressed,
  });

  @override
  _AnimatedDescriptionWidgetState createState() => _AnimatedDescriptionWidgetState();
}

class _AnimatedDescriptionWidgetState extends State<AnimatedDescriptionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            width: double.infinity,
            height: 42.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    widget.address,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 35.h,
                    width: 41.w,
                    margin: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appWhite,
                    ),
                    child: IconButton(
                      onPressed: widget.onPressed,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: AppColors.appGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
