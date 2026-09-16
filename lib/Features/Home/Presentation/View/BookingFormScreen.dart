import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Core/Shared_Widgets/CustomeButton.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';
import 'package:parkingapp/Features/Home/Presentation/Manager/booking_form_cubit.dart';
import 'package:parkingapp/Features/Home/Widgets/ChooseGarageSection.dart';
import 'package:parkingapp/Features/Home/Widgets/SelectDateSection.dart';
import 'package:parkingapp/Features/Home/Widgets/SelectTimeSection.dart';

class BookingFormScreen extends StatelessWidget {
  const BookingFormScreen({super.key});

  static Widget withCubit() {
    return BlocProvider(
      create: (_) => BookingFormCubit(),
      child: const BookingFormScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bGColor,
      appBar: AppBar(
        backgroundColor: ColorManager.bGColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Book a Parking Spot',
          style: TextStyle(
            color: ColorManager.titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<BookingFormCubit, BookingFormState>(
        builder: (context, state) {
          final cubit = context.read<BookingFormCubit>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectDateSection(onDateSelected: cubit.selectDate),
                const SizedBox(height: 24),

                SelectTimeSection(onTimeSelected: cubit.selectTime),
                const SizedBox(height: 24),

                ChooseGarageSection(onGarageSelected: cubit.selectGarage),
                const SizedBox(height: 90),

                Customebutton('Next', () async {
                  try {
                    await cubit.saveBooking();

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking Saved Successfully!'),
                        ),
                      );
                      context.push(
                        Routes.parkingSpotScreen,
                        extra: {
                          'garageName': state.selectedGarage,
                          'garageDistance': '1.2 km',
                          'date': cubit.formattedDate(),
                          'time': state.selectedTimeSlot,
                        },
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  }
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
