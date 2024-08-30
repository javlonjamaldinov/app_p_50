// import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
// import 'package:flutter/material.dart';

// class NextContainer extends StatefulWidget {
//   final TextEditingController amountController;
//   final TextEditingController nameController;

//   const NextContainer({
//     super.key,
//     required this.amountController,
//     required this.nameController,
//   });

//   @override
//   State<NextContainer> createState() => _NextContainerState();
// }

// class _NextContainerState extends State<NextContainer> {
//   @override
//   void initState() {
//     super.initState();
//     // Добавляем слушателей для контроллеров
//     widget.amountController.addListener(_updateState);
//     widget.nameController.addListener(_updateState);
//   }

//   @override
//   void dispose() {
//     // Удаляем слушателей при уничтожении виджета
//     widget.amountController.removeListener(_updateState);
//     widget.nameController.removeListener(_updateState);
//     super.dispose();
//   }

//   void _updateState() {
//     print(
//         "Name: ${widget.nameController.text}, Amount: ${widget.amountController.text}"); // Отладочное сообщение
//     setState(() {});
//   }

//   bool get _isFormValid =>
//       widget.nameController.text.isNotEmpty &&
//       widget.amountController.text.isNotEmpty;

//   @override
//   Widget build(BuildContext context) {
//     final Size mq = MediaQuery.sizeOf(context);

//     return GestureDetector(
//       onTap: _isFormValid ? () {} : null,
//       child: Container(
//         height: mq.height * 0.06,
//         width: mq.width * 0.9,
//         decoration: BoxDecoration(
//           color: _isFormValid
//               ? AppColors.green.withOpacity(0.8)
//               : AppColors.green.withOpacity(0.5),
//           borderRadius: BorderRadius.circular(mq.width * 0.03),
//         ),
//         child: Center(
//           child: Text(
//             "Credit application",
//             style: TextStyle(
//               color: AppColors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: mq.width * 0.05,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
