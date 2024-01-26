import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/global/bottom_bar.dart';
import '../../global/app_bar.dart';
import '../../global/toast.dart';
import '../../service/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailContoller.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Log In",
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
            ),
            ),
            const SizedBox(height: 30),
            FormContainerWidget(
              hintText: 'jane@example.com',
              controller: _emailContoller,
              isPasswordField: false,
            ),
            const SizedBox(height: 30),
            FormContainerWidget(
              hintText: '••••••••••••',
              controller: _passwordController,
              isPasswordField: true,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _signIn();
              },
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Center(
                  child: Text("LOG IN", style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Roboto',fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _signIn() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailContoller.text;
    String password = _passwordController.text;

    User ? user = await _auth.signInWithEmailAndPassword(email, password);
    setState(() {
      isSigning = false;
    });
    if (user != null){
      String? username = await _auth.getUsername(user.uid);
      if(username != null){
        print('Вход успещен. Username: $username');
      }else {
        print('Не удалось получить Username');
      }

      showToast(message: "Успешный вход");
    Get.offAll(const BottomBar());
    } else {
      showToast(message: "Ошибка");
    }
  }
}