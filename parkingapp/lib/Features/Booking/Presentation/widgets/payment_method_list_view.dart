import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_cubit.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_state.dart';

import 'payment_method_item.dart';

class PaymentMethodListView extends StatelessWidget {
  const PaymentMethodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();

        return Column(
          children: [
            PaymentMethodItem(
              title: "Mastercard",
              subtitle: "**** 1234",
              iconPath: "assets/images/mastercard.jpeg",
              isSelected: cubit.selectedPaymentMethod == 'Mastercard',
              onTap: () => cubit.selectPaymentMethod('Mastercard'),
            ),
            PaymentMethodItem(
              title: "Visa",
              subtitle: "**** 5678",
              iconPath: "assets/images/visa.jpeg",
              isSelected: cubit.selectedPaymentMethod == 'Visa',
              onTap: () => cubit.selectPaymentMethod('Visa'),
            ),
            PaymentMethodItem(
              title: "Paypal",
              subtitle: "Linked Account",
              iconPath: "assets/images/paypal.jpeg",
              isSelected: cubit.selectedPaymentMethod == 'Paypal',
              onTap: () => cubit.selectPaymentMethod('Paypal'),
            ),
            PaymentMethodItem(
              title: "Apple Pay",
              subtitle: "Linked Account",
              iconPath: "assets/images/apple_pay.jpeg",
              isSelected: cubit.selectedPaymentMethod == 'Apple Pay',
              onTap: () => cubit.selectPaymentMethod('Apple Pay'),
            ),
          ],
        );
      },
    );
  }
}
