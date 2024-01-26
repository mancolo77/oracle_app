import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/user_auth/auth_pages/signup_page_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'global/bottom_bar.dart';
import 'main_page/main_screen.dart';
import 'user_auth/auth_pages/login_page.dart';
import 'user_auth/auth_pages/signup_page.dart';
import 'welcome_page/welcome_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
  _init();
}
_init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('user_uid');
  if (token != null){
    print('Token: $token');
    Get.offAll(const BottomBar());
  } else {
    Get.offAll(const LoginPage());
}
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oracle',
      getPages: [
        GetPage(name: '/', page: ()=> const WelcomePage()),
        GetPage(name: '/login', page: ()=> const LoginPage()),
        GetPage(name: '/register', page: ()=> const SignUpPage()),
        GetPage(name: '/second_page', page: ()=> const SignUpPageAfter()),
        GetPage(name: '/home', page: ()=> const HomePage()),
        ],
    );
  }
}