import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/Manager/LoginCubit.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/View/LoginScreen.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/Manager/SignupCubit.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/View/SignupScreen.dart';
import 'package:parkingapp/Features/Booking/Data/Models/booking_model.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/BookingConfirmedScreen.dart';
import 'package:parkingapp/Features/Booking/Presentation/View/payment_screen.dart';

import 'package:parkingapp/Features/Home/Presentation/View/BookingFormScreen.dart'
    as home;

import 'package:parkingapp/Features/Home/Presentation/View/GarageOverviewScreen.dart';
import 'package:parkingapp/Features/Home/Presentation/View/parkingSpotScreen.dart';
import 'package:parkingapp/Features/MyBooking/Presentation/Manager/MyBookingCubit.dart';
import 'package:parkingapp/Features/MyBooking/Presentation/View/MyBookingScreen.dart';

import 'package:parkingapp/Features/Profile/Presentation/Manager/ProfileCubit.dart';
import 'package:parkingapp/Features/Profile/Presentation/View/ProfileScreen.dart';
import 'package:parkingapp/Features/Splash/Presentation/Manager/Splash_cubit%20.dart';
import 'package:parkingapp/Features/Splash/Presentation/View/SplashScreen.dart';
import 'package:parkingapp/Features/onBoarding/onBoardingScreen.dart';

class AppRouter {
  static List<GoRoute> routes = [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SplashCubit(),
        child: const Splashscreen(),
      ),
    ),
    GoRoute(
      path: Routes.OnboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.signupScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => Signupcubit(),
        child: SignupScreen(),
      ),
    ),
    GoRoute(
      path: Routes.loginScrren,
      builder: (context, state) =>
          BlocProvider(create: (context) => Logincubit(), child: Loginscreen()),
    ),
    GoRoute(
      path: Routes.Garageoverviewscreen,
      builder: (context, state) => GarageOverviewScreen(),
    ),
    GoRoute(
      path: Routes.profileScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ProfileScreen(),
      ),
    ),
    GoRoute(
      path: Routes.myBookingScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => MyBookingCubit()..fetchBookings(),
          child: const MyBookingScreen(),
        );
      },
    ),

    GoRoute(
      path: Routes.parkingSpotScreen,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ParkingSpotScreen.withCubit(
          garageName: extra['garageName'],
          garageDistance: extra['garageDistance'],
          date: extra['date'],
          time: extra['time'],
        );
      },
    ),

    GoRoute(
      path: Routes.bookingFormScreen,
      builder: (context, state) => home.BookingFormScreen.withCubit(),
    ),
    GoRoute(
      path: Routes.paymentScreen,
      builder: (context, state) {
        final bookingModel =
            state.extra as BookingModel? ??
            BookingModel(
              garageName: '',
              date: '',
              time: '',
              spot: '',
              totalPrice: '',
            );
        return PaymentScreen(bookingModel: bookingModel);
      },
    ),
    GoRoute(
      path: Routes.BookingConfirmedScreen,
      builder: (context, state) =>
          BookingConfirmedScreen(bookingModel: state.extra as BookingModel),
    ),
  ];

  static GoRouter router = GoRouter(
    routes: routes,
    initialLocation: Routes.splashScreen,
  );
}
