import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_cubit.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_state.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/custom_button.dart';

import 'booking_summary_card.dart';
import 'payment_method_list_view.dart';

class PaymentScreenBody extends StatelessWidget {
  final BookingModel? bookingModel;

  const PaymentScreenBody({super.key, this.bookingModel});

  @override
  Widget build(BuildContext context) {
    final activeBooking =
        bookingModel ??
        const BookingModel(
          garageName: 'Downtown Mall Garage',
          date: 'Mon, 12 May 2026',
          time: '6 AM - 12 PM',
          spot: 'Level 1 - B108',
          totalPrice: '\$15.60',
          isUpcoming: true,
        );

    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Payment Successful!"),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pushNamed(context, '/BookingConfirmedScreen');
        } else if (state is BookingErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingSummaryCard(bookingModel: activeBooking),
              const SizedBox(height: 20),

              const Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const PaymentMethodListView(),
              const SizedBox(height: 20),

              BlocBuilder<BookingCubit, BookingState>(
                builder: (context, state) {
                  return CustomButton(
                    text: 'Confirm & Pay',
                    onPressed: () {
                      context.read<BookingCubit>().confirmAndPay(activeBooking);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
