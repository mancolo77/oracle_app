import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/app_bar.dart';
import '../../global/toast.dart';
import '../../service/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';

class SignUpPageAfter extends StatefulWidget {
  const SignUpPageAfter({super.key});

  @override
  State<SignUpPageAfter> createState() => _SignUpPageAfterState();
}

class _SignUpPageAfterState extends State<SignUpPageAfter> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose(){
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? arguments = Get.arguments as Map<String, String>?;
    final String email = arguments?['email'] ?? '';
    final String password = arguments?['password'] ?? '';

    return Scaffold(
      appBar: const MainAppBar(),
            body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Register",
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400,
            ),
            ),
            const SizedBox(height: 30),
            FormContainerWidget(
              hintText: 'the_jane',
              controller: _usernameController,
              isPasswordField: false,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
           backgroundColor: Colors.black,
            ),
            onPressed: (){
             _completeRegistration(email, password, _usernameController.text);
            },
            child: const Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
void _completeRegistration(String email, String password, String username) async {
  setState(() {
    isSigningUp = true;
  });

  // Теперь у вас есть доступ к переданным email, password и username
  print("Email: $email, Password: $password, Username: $username");

  User? user = await _auth.signUpWithEmailAndPassword(email, password, username);

  setState(() {
    isSigningUp = false;
  });

  if (user != null) {
    showToast(message: "Вы успешно зарегистрировались");
    Get.offAllNamed('/home');
  } else {
    showToast(message: "Произошла ошибка");
  }
}
  }