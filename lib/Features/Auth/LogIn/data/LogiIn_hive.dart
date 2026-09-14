import 'package:hive/hive.dart';

class LogiinHive {
    final Box box = Hive.box("Userlogin");
    void UserLogin(String email,String password){
       box.put("email", email);
    box.put("password", password);

    }
    dynamic getEmail(){
       return box.get("email");
    }
    dynamic getPassword(){
       return box.get("password");
    }
  
      void deleteUser() {
    box.delete("user");
  }
}