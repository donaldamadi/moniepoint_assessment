import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_assessment/constants/colors.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/bottom_sheet_content.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/buy_container.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/greeting.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/header.dart';
import 'package:moniepoint_assessment/features/home/presentation/widgets/rent_container.dart';
import 'package:moniepoint_assessment/utils/widget_extensions.dart';

/// With this implementation, I tried showing the different types of animations:
/// - Fade animation
/// - Slide animation
/// - Scale animation
/// - Height animation
/// - Bottom sheet animation
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _slideController;
  late final AnimationController _scaleController;
  late final AnimationController _heightController;
  late final AnimationController _bottomSheetController;

  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _bottomSheetAnimation;

  bool _showHeight = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  /// Initializes all the animation controllers and their corresponding animations.
  void _initializeAnimations() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _heightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOutBack,
    );

    _bottomSheetAnimation = CurvedAnimation(
      parent: _bottomSheetController,
      curve: Curves.easeInOut,
    );
  }

  /// Starts the animations in sequence with delays.
  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    _slideController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    _scaleController.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _showHeight = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    _showAnimatedBottomSheet();
  }

  /// Displays the animated bottom sheet when the animations complete.
  void _showAnimatedBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.65,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(_bottomSheetAnimation),
            child: const BottomSheetContent(),
          ),
        );
      },
    ).whenComplete(() {
      _bottomSheetController.reset();
    });
    _bottomSheetController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _heightController.dispose();
    _bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.appWhiteBrown,
              AppColors.appBrown,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: const HomeHeader(),
              ),
              const Gap(20),
              SlideTransition(
                position: _slideAnimation,
                child: const HomeGreeting(),
              ),
              const Gap(20),
              ScaleTransition(
                scale: _scaleAnimation,
                child: const BuyRentSection(),
              ),
              const Gap(20),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: _showHeight ? 170.h : 0,
                width: double.infinity,
                curve: Curves.easeInOut,
                child: const BuyRentSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Widget for the Buy and Rent section with two containers.
class BuyRentSection extends StatelessWidget {
  const BuyRentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuyContainer(),
          Gap(10),
          RentContainer(),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
