import 'package:flutter/material.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/image_description.dart';

class BottomSheetImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final String address;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const BottomSheetImageWidget({super.key, required this.imageUrl, required this.address, this.height, this.width, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedDescriptionWidget(
              address: address,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
