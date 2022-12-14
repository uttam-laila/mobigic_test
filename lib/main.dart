import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:mobigic_test/application/providers.dart';
import 'package:mobigic_test/injection.dart';
import 'package:mobigic_test/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: List.from(providers),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, _) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mobigic Test',
            home: SafeArea(child: SplashScreen()),
          );
        },
      ),
    );
  }
}
