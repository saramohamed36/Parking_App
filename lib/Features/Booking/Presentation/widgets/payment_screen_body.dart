import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Features/MyBooking/Data/models/BookingModel.dart'
    as my_model;
import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_cubit.dart';
import 'package:parkingapp/Features/Booking/Presentation/Manager/booking_state.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/BookingConfirmedScreen.dart';
import 'package:parkingapp/Features/Booking/Presentation/widgets/custom_button.dart';
import 'package:parkingapp/Features/MyBooking/Presentation/Manager/MyBookingCubit.dart';

import 'booking_summary_card.dart';
import 'payment_method_list_view.dart';

class PaymentScreenBody extends StatelessWidget {
  final BookingModel bookingModel;

  const PaymentScreenBody({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Payment Successful!"),
              backgroundColor: Colors.green,
            ),
          );

          context.go(Routes.BookingConfirmedScreen, extra: bookingModel);
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
              BookingSummaryCard(bookingModel: bookingModel),
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
                  final isLoading = state is BookingLoadingState;

                  return CustomButton(
                    text: isLoading ? 'Processing...' : 'Confirm & Pay',
                    onPressed: isLoading
                        ? null
                        : () {
                            List<String> dateParts = bookingModel.date.split(
                              ' ',
                            );

                            context.read<MyBookingCubit>().addBooking(
                              my_model.BookingModel(
                                dayName: "Wed",
                                dayNumber: dateParts.isNotEmpty
                                    ? dateParts[0]
                                    : "16",
                                month: dateParts.length > 1
                                    ? dateParts[1]
                                    : "Sep",
                                garageName: bookingModel.garageName,
                                timeSlot: bookingModel.time,
                                spotInfo: "Level 1 - ${bookingModel.spot}",
                                status: "Upcoming",
                              ),
                            );
                            // 2. استكمال عملية الدفع
                            context.read<BookingCubit>().confirmAndPay(
                              bookingModel,
                            );
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
