import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_assessment/constants/colors.dart';
import 'package:moniepoint_assessment/utils/widget_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.appWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.appGold,
              ),
              Gap(4),
              Text('Saint Petersburg', style: TextStyle(color: AppColors.appGold)),
            ],
          ),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
      ],
    ).paddingSymmetric(
      vertical: 4,
      horizontal: 20,
    );
  }
}
