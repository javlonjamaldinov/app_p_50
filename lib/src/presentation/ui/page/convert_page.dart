import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:flutter/material.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Convert'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CurrencyInputBlock(),
            SizedBox(height: 20),
            SwapButton(),
            SizedBox(height: 20),
            CurrencyInputBlock(),
          ],
        ),
      ),
    );
  }
}

class CurrencyInputBlock extends StatelessWidget {
  const CurrencyInputBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Currency',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyButton(label: 'Mex\$'),
              CurrencyButton(label: 'JPY'),
              CurrencyButton(label: 'USD'),
              CurrencyButton(label: 'EUR'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter amount',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class CurrencyButton extends StatelessWidget {
  final String label;

  const CurrencyButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(label),
    );
  }
}

class SwapButton extends StatelessWidget {
  const SwapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[600],
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.swap_horiz,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
