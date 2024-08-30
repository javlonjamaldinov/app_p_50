import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:app_p_50/src/presentation/ui/page/buy_page.dart';
import 'package:app_p_50/src/presentation/ui/page/settings_page.dart';
import 'package:app_p_50/src/presentation/ui/page/statistics_page.dart';
import 'package:app_p_50/src/presentation/ui/page/convert_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ConvertPage(),
    const BuyPage(),
    const StatisticsPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 11,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () => _onItemTapped(0),
                  icon: Icon(
                    Icons.swap_vert,
                    size: 25,
                    color: _currentIndex == 0
                        ? AppColors.black
                        : AppColors.grey,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () => _onItemTapped(1),
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                    color: _currentIndex == 1
                        ? AppColors.black
                        : AppColors.grey, 
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () => _onItemTapped(2),
                  icon: Icon(
                    Icons.bar_chart,
                    size: 25,
                    color: _currentIndex == 2
                        ? AppColors.black
                        : AppColors.grey, 
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () => _onItemTapped(3),
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                    color: _currentIndex == 3
                        ? AppColors.black
                        : AppColors.grey, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
