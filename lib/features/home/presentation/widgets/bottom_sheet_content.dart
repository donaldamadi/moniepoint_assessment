import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/bottom_sheet_image.dart';

/// Widget for the content inside the bottom sheet.
class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BottomSheetImageWidget(
            margin: const EdgeInsets.all(5),
            height: 200.h,
            width: double.infinity,
            imageUrl: "assets/images/image_1.jpg",
            address: "Gladkova St., 25",
          ),
          Row(
            children: [
              Expanded(
                child: BottomSheetImageWidget(
                  margin: const EdgeInsets.only(top: 5, left: 5, right: 2.5, bottom: 5),
                  height: 420.h,
                  imageUrl: "assets/images/image_2.jpg",
                  address: "Gladkova St., 25",
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    BottomSheetImageWidget(
                      margin: const EdgeInsets.only(top: 5, left: 2.5, right: 5, bottom: 5),
                      height: 200.h,
                      width: 180.w,
                      imageUrl: "assets/images/image_3.jpg",
                      address: "Gladkova St., 25",
                    ),
                    BottomSheetImageWidget(
                      margin: const EdgeInsets.only(top: 5, left: 2.5, right: 5, bottom: 5),
                      height: 200.h,
                      width: 180.w,
                      imageUrl: "assets/images/image_4.jpg",
                      address: "Gladkova St., 25",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
