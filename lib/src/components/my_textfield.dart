import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;

  const MyTextfield({
    super.key,
    required this.hintText,
    required double width, required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mq.width *
              0.03), 
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 55, 
              decoration: BoxDecoration(
                color: AppColors.txgrey,
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: mq.width * 0.03,
                      top: 14,
                      bottom:
                          14), // Adjust left padding relative to screen width
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.txgrey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.txgrey),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
