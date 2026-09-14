import 'package:hive/hive.dart';
part 'User_Model.g.dart';
@HiveType(typeId: 0)
class UserModel{
   @HiveField(0)
  String name;
   @HiveField(1)
  String email;
   @HiveField(2)
  String phone;
   @HiveField(3)
  String uid;
 UserModel({required this.name,required this.email, required this.phone,required this.uid});

factory  UserModel.fromJson(Map<String,dynamic>json){
  return UserModel(
    name:json ["name"]??"unknown",
    email:json ["email"]??"unknown",
    phone:json ["phone"]??"unknown",
    uid:json ["uid"]??"unknown",
  );
 }
Map<String,dynamic>toJson(){
  return{
    "name":name,
    "email":email,
    "phone":phone,
    "uid":uid
  };
}

}