import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parkingapp/Core/Routing/Routes.dart';
import 'package:parkingapp/Core/Shared_Widgets/CustomeButton.dart';
import 'package:parkingapp/Core/Shared_Widgets/TextInput.dart';
import 'package:parkingapp/Core/Theme/AppAssets.dart';
import 'package:parkingapp/Core/Theme/ColorManager.dart';
import 'package:parkingapp/Core/Shared_Widgets/AuthHeader.dart';
import 'package:parkingapp/Core/model/User_Model.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/Manager/SignupCubit.dart';
import 'package:parkingapp/Features/Auth/SignUp/Presentation/Manager/SignupState.dart';
import 'package:parkingapp/Features/Home/Presentation/View/GarageOverviewScreen.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "/signupScreen";
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<Signupcubit, Signupstate>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is SignUpSuccessState){
           context.go(Garageoverviewscreen.routeName);
          }
          if(state is SignUpErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message),));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
               context.go(Routes.OnboardingScreen);
              },
              icon: Icon(Icons.arrow_back_ios),
              alignment: Alignment.topLeft,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 32,
                top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Authheader(
                    title: "Create Your Account",
                    subtitle: "Join Smart Parking for a smoother \nparking experience",
                  ),

                  SizedBox(height: 20),
                  Textinput(
                    hinttext: "FullName",
                    controller: name,
                    prefixicon: SvgPicture.asset(Appassets.profileIcon),
                  ),
                  SizedBox(height: 20),
                  Textinput(
                    hinttext: "Email Address",
                    controller: email,
                    prefixicon: SvgPicture.asset(Appassets.emailIcon),
                  ),
                  SizedBox(height: 20),
                  Textinput(
                    hinttext: "Phone Number",
                    controller: phone,
                    prefixicon: SvgPicture.asset(Appassets.phoneIcon),
                  ),
                  SizedBox(height: 20),
                  Textinput(
                    isvisible: true,
                    hinttext: "Password",
                    controller: password,
                    prefixicon: SvgPicture.asset(Appassets.lockIcon),
                    postfixicon: SvgPicture.asset(Appassets.visibleIcon),
                  ),
                  SizedBox(height: 32),
                  Customebutton("Sign Up", () {
                    UserModel user=
                    UserModel(name: name.text, email: email.text, phone: phone.text, uid: "");
                    context.read<Signupcubit>().SignUpUser(user, password.text);
                   context.go(Garageoverviewscreen.routeName);
                  }),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: ColorManager.subtitleColor,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: ColorManager.buttonColor,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(Routes.loginScrren);
                                print("Login");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
