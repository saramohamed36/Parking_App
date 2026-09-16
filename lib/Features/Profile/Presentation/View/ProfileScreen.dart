import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Core/Shared_Widgets/BottomNav.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';
import 'package:parkingapp/Features/Profile/widgets/userInfoHeader.dart';
import 'package:parkingapp/Features/Profile/widgets/ProfileOptionTile.dart';

import '../Manager/ProfileCubit.dart';
import '../Manager/ProfileState.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bGColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoHeader(name: state.name, email: state.email),
                      const SizedBox(height: 24),

                      ProfileOptionTile(
                        icon: Icons.calendar_month_outlined,
                        title: 'My Bookings',
                        onTap: () {
                          context.go(Routes.myBookingScreen);
                        },
                      ),
                      ProfileOptionTile(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Payment Methods',
                        onTap: () {
                          context.go(Routes.paymentScreen);
                        },
                      ),
                      ProfileOptionTile(
                        icon: Icons.favorite_border_rounded,
                        title: 'Favorites Garages',
                        onTap: () {
                          context.go(Routes.Garageoverviewscreen);
                        },
                      ),
                      ProfileOptionTile(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      ProfileOptionTile(
                        icon: Icons.help_outline_rounded,
                        title: 'Help & Support',
                        onTap: () {},
                      ),

                       SizedBox(height: 12.h),

                      ProfileOptionTile(
                        icon: Icons.logout_rounded,
                        title: 'Log Out',
                        isLogOut: true,
                        onTap: () async {
                          await context.read<ProfileCubit>().logout();
                          if (context.mounted) {
                            context.go(Routes.loginScrren);
                          }
                        },
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style:  TextStyle(color: Colors.red, fontSize: 16.sp),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(
        currentIndex: 3, 
      ),
    );
  }
}
