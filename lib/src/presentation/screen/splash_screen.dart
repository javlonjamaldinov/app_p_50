import 'package:app_p_50/src/data/helper/global.dart';
import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:app_p_50/src/presentation/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Welcome(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(mq.width * .010),
          child: Image.asset(
            'assets/icons/ytp.png',
            width: mq.width * .2,
          ),
        ),
      ),
    );
  }
}
