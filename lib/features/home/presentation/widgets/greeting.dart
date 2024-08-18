import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/constants/colors.dart';
import 'package:moniepoint_assessment/utils/widget_extensions.dart';

class HomeGreeting extends StatelessWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, Marina",
          style: TextStyle(
            color: AppColors.appGold,
            fontSize: 18,
          ),
        ),
        Text(
          "let's select your perfect place",
          style: TextStyle(
            letterSpacing: -0.9,
            fontSize: 30,
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
