import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic_test/presentation/core/constants.dart';
import 'package:mobigic_test/presentation/home_screen.dart';
import 'package:mobigic_test/presentation/widgets/container_with_border.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const SafeArea(child: HomePage());
      }), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerWithBorder(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      boxColor: AppConstants.green,
      child: Center(
          child: Icon(
        Icons.gamepad,
        color: AppConstants.white,
        size: 36.sp,
      )),
    ));
  }
}
