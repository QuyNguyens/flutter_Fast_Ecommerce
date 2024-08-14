import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/models/select_cash_delivery.dart';

class PaymentMethodCard extends StatelessWidget {
  final SelectCashDelivery paymentMethod;
  final bool isSelected;

  const PaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? App.seedColor : App.subPriceColor, // Show border only when selected
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.radio_button_checked_outlined, color: isSelected ? App.seedColor : const Color.fromARGB(255, 208, 205, 205)),
                const SizedBox(width: 40,),
                paymentMethod.icon,
              ],
            ),
            const SizedBox(height: 5,),
            Text(paymentMethod.label, style: const TextStyle(fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}