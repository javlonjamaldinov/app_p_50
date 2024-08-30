import 'package:app_p_50/src/data/local/my_text.dart';
import 'package:flutter/material.dart';
import 'package:app_p_50/src/components/calendar.dart';
import 'package:app_p_50/src/components/my_back_buttom.dart';
import 'package:app_p_50/src/components/my_textfield.dart';
import 'package:app_p_50/src/components/custom_container.dart';
import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';

class CreditApplicationPage extends StatefulWidget {
  const CreditApplicationPage({super.key});

  @override
  _CreditApplicationPageState createState() => _CreditApplicationPageState();
}

class _CreditApplicationPageState extends State<CreditApplicationPage> {
  final List<bool> _selectedCategories = List.generate(7, (_) => false);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateState);
    _amountController.addListener(_updateState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateState);
    _amountController.removeListener(_updateState);
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _updateState() {
    final nameValid = _nameController.text.isNotEmpty;
    final amountValid = _amountController.text.isNotEmpty;
    final categorySelected = _selectedCategories.contains(true);

    // Отладочные выводы
    print('Name: ${_nameController.text}');
    print('Amount: ${_amountController.text}');
    print('Category Selected: $categorySelected');

    setState(() {
      _isFormValid = nameValid && amountValid && categorySelected;
      print('Form Validity: $_isFormValid'); // Отладочный вывод
    });
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategories[index] = !_selectedCategories[index];
      _updateState(); // Убедитесь, что состояние обновляется при изменении категории
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                right: mq.width * 0.3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyBackButton(),
                  SizedBox(width: mq.width * 0.015),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: mq.width * 0.075,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.03),
            MyTextfield(
              controller: _nameController,
              hintText: 'Name',
              width: mq.width * 0.9,
            ),
            SizedBox(height: mq.height * 0.025),
            Row(
              children: [
                Expanded(
                  child: MyTextfield(
                    controller: _amountController,
                    hintText: 'Amount',
                    width: mq.width * 0.7,
                  ),
                ),
                SizedBox(width: mq.width * 0.01),
                CustomDropdown(
                  height: mq.height * 0.05,
                ),
              ],
            ),
            SizedBox(height: mq.height * 0.020),
            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: mq.width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.01),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryContainer(0),
                    _buildCategoryContainer(1),
                    _buildCategoryContainer(2),
                  ],
                ),
                SizedBox(height: mq.height * 0.01),
                Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryContainer(3),
                      _buildCategoryContainer(4),
                    ],
                  ),
                ),
                SizedBox(height: mq.height * 0.01),
                Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryContainer(5),
                      _buildCategoryContainer(6),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: mq.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                "Payment schedule, date",
                style: TextStyle(
                  fontSize: mq.width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Calendar(),
            const SizedBox(height: 180),
            GestureDetector(
              onTap: () {
                if (_isFormValid) {
                  final formData = {
                    'name': _nameController.text,
                    'amount': _amountController.text,
                    'categories': _selectedCategories,
                  };
                  Navigator.pop(context, formData);
                } else {
                  print('Form is not valid'); 
                }
              },
              child: Container(
                height: mq.height * 0.06,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: _isFormValid
                      ? AppColors.green.withOpacity(0.9)
                      : AppColors.green.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(mq.width * 0.03),
                ),
                child: Center(
                  child: Text(
                    "Credit application",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: mq.width * 0.05,
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

  Widget _buildCategoryContainer(int index) {
    bool isSelected = _selectedCategories[index];
    return GestureDetector(
      onTap: () => _onCategorySelected(index),
      child: IntrinsicWidth(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.green : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.done,
                  size: 20,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  categories[index],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
