import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/constants/colors.dart';

/// Widget for the Rent container.
class RentContainer extends StatelessWidget {
  const RentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.appWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "RENT",
                style: TextStyle(
                  color: AppColors.appGold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "2 212",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appGold,
                    ),
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(color: AppColors.appGold),
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
