import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/constants/colors.dart';

/// Widget for the Buy container.
class BuyContainer extends StatelessWidget {
  const BuyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appOrange,
        ),
        child: const Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "BUY",
                style: TextStyle(
                  color: AppColors.appWhite,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "1 034",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appWhite,
                    ),
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(color: AppColors.appWhite),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
