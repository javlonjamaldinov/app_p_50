import 'dart:ui';
import 'package:app_p_50/src/presentation/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_p_50/src/presentation/ui/page/convert_page.dart';

import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';

void showNotificationDialog(BuildContext context, VoidCallback onAllow) {
  final mq = MediaQuery.of(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Padding(
          padding: EdgeInsets.only(top: mq.size.height * 0.05),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mq.size.width * 0.05),
            ),
            title: const Text(
              'NOTIFICATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: mq.size.width * 0.77,
                maxWidth: mq.size.width * 0.9,
              ),
              child: const Text(
                'Click on allow to receive notifications',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Block',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onAllow();
                },
                child: const Text(
                  'Allow',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showNotificationDialogForCameraAccess(
    BuildContext context, VoidCallback onAllow) {
  final mq = MediaQuery.of(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Padding(
          padding: EdgeInsets.only(top: mq.size.height * 0.05),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mq.size.width * 0.05),
            ),
            title: const Text(
              'NOTIFICATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: mq.size.width * 0.77,
                maxWidth: mq.size.width * 0.9,
              ),
              child: const Text(
                'Click on allow to grant access to the camera',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Block',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onAllow();
                },
                child: const Text(
                  'Allow',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showSpecialOffersDialog(BuildContext context) {
  final mq = MediaQuery.of(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Padding(
          padding: EdgeInsets.only(top: mq.size.height * 0.05),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(mq.size.width * 0.06),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: mq.size.width * 0.5),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.zero,
            content: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: mq.size.width * 0.7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/office.png',
                    height: mq.size.height * 0.2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Special Offers',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            actions: [
              Center(
                child: Container(
                  width: mq.size.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.tertiary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => BottomNavBar(),
                        ),
                      );
                    },
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
