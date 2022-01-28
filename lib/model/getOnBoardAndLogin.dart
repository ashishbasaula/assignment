import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getOnboardData extends GetxController {
  RxBool isfirst = true.obs;
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
  }

  void getInfo() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isfirst.value = _pref.getBool("Isfirst") ?? true;
    isLogin.value = _pref.getBool("isLog") ?? false;
  }
}
