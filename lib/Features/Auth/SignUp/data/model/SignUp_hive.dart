import 'package:hive/hive.dart';
import 'package:parkingapp/Core/model/User_Model.dart';

class SignupHive {
  final Box  box=Hive.box("UserSignUp");
  void saveuser(UserModel user){
    box.put("user", user);
  }
 UserModel? getUser(){
    return box.get("user");
  }
  void updateUser(UserModel user){
    box.put("user", user);
  }
  void deleteUser(){
    box.delete("user");
  }
}