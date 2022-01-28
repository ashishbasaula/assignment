import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserData extends GetxController {
  var userName = "ashish".obs;
  var email = "aisjdh".obs;
  var password = "asda".obs;
  var isLoad = "not".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPref();
  }

  void getPref() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    userName.value = _pref.getString("userName")!;
    email.value = _pref.getString("Email")!;
    password.value = _pref.getString("Password")!;
    isLoad.value = "yes";
  }
}
