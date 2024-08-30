import 'package:flutter/material.dart';
import 'package:app_p_50/src/presentation/ui/widgets/notification_dialog.dart';
import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  void _showNotificationDialog(BuildContext context) {
    showNotificationDialog(
      context,
      () {
        showNotificationDialogForCameraAccess(
          context,
          () {
            showSpecialOffersDialog(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.green,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: mq.size.height * 0.12,
              left: mq.size.width * 0.06,
            ),
            child: const Text(
              'Keep track of \npurchases:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: mq.size.height * 0.012),
          Padding(
            padding: EdgeInsets.only(
              left: mq.size.width * 0.06,
            ),
            child: const Text(
              'Simplify the purchase of \n products in the store and \n their accounting',
              style: TextStyle(
                fontSize: 23,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: mq.size.height * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.size.width * 0.065,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  _showNotificationDialog(context);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.tertiary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: mq.size.height * 0.016,
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mq.size.height * 0.01,
            ),
            child: Image.asset(
              'assets/icons/gr.png',
              height: mq.size.height * 0.48,
            ),
          ),
        ],
      ),
    );
  }
}
