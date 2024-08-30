import 'package:flutter/material.dart';
import 'package:app_p_50/src/presentation/ui/theme/app_color.dart';
import 'package:app_p_50/src/presentation/ui/page/credit_application_page.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  Map<String, dynamic>? _formData;

  Future<void> _navigateAndRetrieveData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreditApplicationPage(),
      ),
    );

    if (result != null) {
      setState(() {
        _formData = result as Map<String, dynamic>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: mq.height * 0.05), 
            child: Center(
              child: Text(
                'Buy',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: mq.width * 0.08, 
                ),
              ),
            ),
          ),
          SizedBox(height: mq.height * 0.02),
          Center(
            child: GestureDetector(
              onTap: () {
                _navigateAndRetrieveData(context);
              },
              child: Container(
                height: mq.height * 0.06, 
                width: mq.width * 0.9, 
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                      mq.width * 0.03),
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
          ),
          SizedBox(height: mq.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: mq.height * 0.06, 
                width: mq.width * 0.50, 
                decoration: BoxDecoration(
                  color: AppColors.tertiary,
                  borderRadius: BorderRadius.circular(
                      mq.width * 0.03),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.note_add_outlined, 
                      color: AppColors.white,
                    ),
                    SizedBox(
                        width: mq.width * 0.02), 
                    Text(
                      "Credit application",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: mq.width * 0.04, 
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: mq.width * 0.01),
              Container(
                height: mq.height * 0.06, 
                width: mq.width * 0.3, 
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(
                      mq.width * 0.03), 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined, 
                      color: AppColors.black,
                    ),
                    SizedBox(
                        width: mq.width * 0.02), 
                    Text(
                      "\$0.00",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mq.width * 0.04, 
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: mq.height * 0.15), 
          _formData == null
              ? Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.not_interested,
                        size: mq.width * 0.12, 
                        color: AppColors.red,
                      ),
                    ),
                    SizedBox(height: mq.height * 0.01),
                    Center(
                      child: Text(
                        "There is no data for this page",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: mq.width * 0.04, 
                        ),
                      ),
                    ),
                    SizedBox(height: mq.height * 0.005),
                    Center(
                      child: Text(
                        "Tap the + button to create a new entry",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: mq.width * 0.03, 
                        ),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(mq.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${_formData!['name']}',
                        style: TextStyle(
                          fontSize: mq.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mq.height * 0.02),
                      Text(
                        'Amount: ${_formData!['amount']}',
                        style: TextStyle(
                          fontSize: mq.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mq.height * 0.02),
                      Text(
                        'Date: ${_formData!['date']?.toLocal().toShortDateString() ?? 'Not selected'}',
                        style: TextStyle(
                          fontSize: mq.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mq.height * 0.02),
                      Text(
                        'Categories: ${_formData!['categories'].asMap().entries.where((entry) => entry.value).map((entry) => 'Category ${entry.key + 1}').join(', ')}',
                        style: TextStyle(
                          fontSize: mq.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade400,
        onPressed: () {
          _navigateAndRetrieveData(context);
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
