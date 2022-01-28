import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends GetxController {
  static RxBool isSave = false.obs;
  String Username = "skdf";
  String userEmail = "sdf";
  String userPass = "sdf";
  UserData(this.Username, this.userEmail, this.userPass);

  void saveUserInfo() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("userName", Username);
    _pref.setString("Email", userEmail);
    _pref.setString("Password", userPass);
    isSave.value = true;
    Fluttertoast.showToast(msg: "Sucessfully Registered");
  }
}
