import 'package:flutter/material.dart';
import 'package:my_app/ui/category/view/models/select_cash_delivery.dart';
import 'package:my_app/ui/category/view/widget/payment_method_card.dart';

class PaymentSelectionPage extends StatefulWidget {
  const PaymentSelectionPage({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentSelectionPageState();
}

class _PaymentSelectionPageState extends State<PaymentSelectionPage> {
  late List<SelectCashDelivery> paymentMethods;
  SelectCashDelivery? selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    paymentMethods = SelectCashDelivery.selectedCategories;
    selectedPaymentMethod = paymentMethods.firstWhere(
      (method) => method.isSelected,
      orElse: () => paymentMethods[0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: paymentMethods.map((paymentMethod) {
        return Expanded(
          child: GestureDetector(
            onTap: () => _onPaymentMethodChanged(paymentMethod),
            child: PaymentMethodCard(
              paymentMethod: paymentMethod,
              isSelected: paymentMethod == selectedPaymentMethod,
            ),
          ),
        );
      }).toList(),
    );
  }

  void _onPaymentMethodChanged(SelectCashDelivery paymentMethod) {
    setState(() {
      selectedPaymentMethod?.isSelected = false;
      paymentMethod.isSelected = true;
      selectedPaymentMethod = paymentMethod;
    });
  }
}