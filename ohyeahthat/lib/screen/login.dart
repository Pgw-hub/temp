import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF88A4B8),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const SizedBox(
              height: 300,
              width: 250,
              child: Image(
                image: AssetImage('assets/logo.png')
              )
            ),
            const Text(
              '아맞다',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'login',
                fontSize: 75,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'oh yeah that',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'login',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 7,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Text(
              '로그인 | 회원가입',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SignInButton(
              Buttons.Google,
              onPressed:() {},
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '한동대학교 계정(@handong.edu)으로만\n로그인 할 수 있습니다.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100
            )
          ]
        )
      )
    );
  }
}