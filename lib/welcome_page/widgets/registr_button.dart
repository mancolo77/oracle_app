import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrButton extends StatelessWidget {
  const RegistrButton({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
      width: 167,
      height: 52,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
       ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
            ),
            onPressed: (){
             Get.offAllNamed('/register');
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
    );
  }  
  }