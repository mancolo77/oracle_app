import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  Future<void> signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // Redirect to the login screen using GetX
    Get.offAllNamed('/login'); // Replace '/login' with your actual login route
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is an empty page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the signOut function when the button is pressed
                signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
