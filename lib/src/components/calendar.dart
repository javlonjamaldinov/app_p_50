import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.03), // 12.0 from the original
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.txfgrey),
          borderRadius:
              BorderRadius.circular(mq.width * 0.03), // 12.0 from the original
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: mq.width * 0.02), // 10.0 from the original
              child: Text(
                _selectedDate == DateTime.now()
                    ? 'Today'
                    : '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                style: TextStyle(
                  fontSize: mq.width * 0.04, // 16.0 from the original
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: mq.width * 0.06, // 24.0 from the original
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
