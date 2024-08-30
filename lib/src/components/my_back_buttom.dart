import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Padding(
        padding: EdgeInsets.only(
          right: 100,
          top: 10,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
