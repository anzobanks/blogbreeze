import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import '../pages/main_page.dart';
import '../widgets/loading_widget.dart';

class AppController extends GetxController{
 @override
  void onInit() {
    super.onInit();
    Future.delayed(3.seconds, () {
     
        Get.offAll(() => MainPage());
     
    });
  }

  String? validateForm(String? value) {
    if (value!.isEmpty) {
      return 'Field required';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
          return 'Field required';

    } else if (value.isEmail)
      return null;
    else
      return 'Enter an email';
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
           return 'Field required';

    } else if (value.length < 6)
      return 'Must contain 6 caracteres';
    else {
      return null;
    }
  }

 

  String? validateDateTime(DateTime? value) {
    if (value == null) {
        return 'Field required';

    } else {
      return null;
    }
  }
    RxBool appMode = Get.isDarkMode.obs;


  Future<bool> checkNetwork() async {
      try {
          bool isInternetAvailable = await isConnected();
     

return isInternetAvailable;
      } catch (e) {
     throw Exception('Please check your netwok');


      }
    }
    void performAction(action()) async {
    bool isInternetAvailable = await isConnected();
    if (isInternetAvailable) {
      action();

      
    } else {
    
         Fluttertoast.showToast(
            msg: "Please check your network".tr, backgroundColor: Colors.red, timeInSecForIosWeb: 3);
      overlayEntry.remove();
    }
  }

  String formatDate(DateTime dateTime) {

  final DateFormat formatter = DateFormat('d MMMM y', 'fr_FR');
  return formatter.format(dateTime);
}

  void changeTheme() {
    appMode.toggle();
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }
    Future<bool> isConnected() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
      return result;

    } else {
      print('No internet :( Reason:');
      print(InternetConnectionChecker().checkInterval);
      return result;
    }
  }
}