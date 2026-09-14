
import 'package:parkingapp/Core/model/User_Model.dart';

abstract class  Signupstate{}
class SignUpInitialState extends Signupstate{}
class SignUpLoadingState extends Signupstate{}
class SignUpSuccessState extends Signupstate {
  UserModel user;
  SignUpSuccessState(this.user);
}
class SignUpErrorState  extends  Signupstate{
  String message;
  SignUpErrorState(this.message);
}
