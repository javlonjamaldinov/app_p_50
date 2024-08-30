import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final double height;

  const CustomDropdown({
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: <String>['Option 1', 'Option 2'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
          hint: const Text('Select'),
        ),
      ),
    );
  }
}
