import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Core/Shared_Widgets/AuthHeader.dart';
import 'package:parkingapp/Core/Shared_Widgets/CustomeButton.dart';

import 'package:parkingapp/Core/Shared_Widgets/TextInput.dart';
import 'package:parkingapp/Core/Theme/AppAssets.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/Manager/LoginCubit.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/Manager/LoginState.dart';
import 'package:parkingapp/Features/Auth/LogIn/Presentation/widget/SocialButton.dart';
import 'package:parkingapp/Features/Home/Presentation/View/GarageOverviewScreen.dart';

class Loginscreen extends StatelessWidget {
  static const String routeName = "/loginScreen";
  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: BlocListener<Logincubit, Loginstate>(
        listener: (context, state) {
          // TODO: implement listener
           if(state is LoginSuccessState){
           context.go(Garageoverviewscreen.routeName);
          }
          if(state is LoginErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email or Password Not Found"),));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.go(Routes.signupScreen);
              },
              icon: Icon(Icons.arrow_back_ios),
              alignment: Alignment.topLeft,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Authheader(
                  title: "Welcom Back",
                  subtitle: "Login to your account",
                ),

                SizedBox(height: 20.h),
                Textinput(
                  controller: emailOrPhone,
                  hinttext: "Email or Phone Number",
                  prefixicon: SvgPicture.asset(Appassets.emailIcon),
                ),
                SizedBox(height: 20.h),
                Textinput(
                  controller: password,
                  hinttext: "Password",
                  prefixicon: SvgPicture.asset(Appassets.lockIcon),
                  postfixicon: SvgPicture.asset(Appassets.visibleIcon),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: ColorManager.buttonColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Customebutton("Login", () {
                  context.read<Logincubit>().UserLogIn(emailOrPhone.text, password.text);
               
                }),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorManager.hintColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: ColorManager.subtitleColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorManager.hintColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SocialButton(
                  image: Appassets.googleIcon,
                  text: "Continue with Google",
                  onTap: () {
                     context.read<Logincubit>().GoogleLogin();
                  },
                ),
                SizedBox(height: 20.h),
                SocialButton(
                  image: Appassets.FacebookIcon,
                  text: "Continue with Facebook",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
