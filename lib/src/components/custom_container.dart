import 'package:flutter/material.dart';
import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required double height});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String _selectedValue = 'Select';

  void _onSelect(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final Size mq = MediaQuery.sizeOf(context);

  
    const double containerWidth = 110.0; 
    const double containerHeight = 54.0; 

    return Padding(
      padding: EdgeInsets.only(right: mq.width * 0.05), // Отступ справа
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
              containerWidth * 0.1), // Радиус скругления (10% от ширины)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: containerWidth * 0.07), // Отступ слева (5% от ширины)
              child: Text(
                _selectedValue,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      containerWidth * 0.13, // Размер шрифта (15% от ширины)
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.black,
                size: containerHeight * 0.5, // Размер иконки (60% от высоты)
              ),
              onSelected: _onSelect,
              itemBuilder: (BuildContext context) {
                return ['Mex\$', 'JPY', 'USD', 'EUR'].map((String value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: containerWidth *
                            0.1, // Размер шрифта в меню (10% от ширины)
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
