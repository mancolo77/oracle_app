import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/app_bar.dart';
import '../../service/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;
  
  @override
  void dispose(){
    _emailController.dispose();
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
              hintText: 'jane@example.com',
              controller: _emailController,
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
            ElevatedButton(
            style: ElevatedButton.styleFrom(
           backgroundColor: Colors.black,
            ),
            onPressed: (){
             _goToNextStep();
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
            // GestureDetector(
            //   onTap: () {
            //     _signUp();
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     height: 52,
            //     decoration: ShapeDecoration(
            //       color: Colors.black,
            //       shape: RoundedRectangleBorder(
            //         side: const BorderSide(width: 2),
            //         borderRadius: BorderRadius.circular(6),
            //       ),
            //     ),
            //     child: const Center(
            //       child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Roboto',fontWeight: FontWeight.w900),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
void _goToNextStep() async {
  setState(() {
    isSigningUp = true;
  });

  String email = _emailController.text;
  String password = _passwordController.text;

  Get.toNamed('/second_page', arguments: {'email': email, 'password': password});
  setState(() {
    isSigningUp = false;
  });
}
}