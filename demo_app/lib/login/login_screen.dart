import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: Image.network(
                  'https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj'),
            ),
          ),
          // email
          TextField(
            controller: emailController,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          // passwork
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          //buton Login
          InkWell(
            onTap: () {
              String email = emailController.text;
              if (email.isEmpty) {
                print('Khong duoc de email rong');
              } else if (email.length < 5) {
                print('ki tu nhap vao phai lon hon 5');
              } else {
                print('object');
              }
            },
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: double.infinity,
              child: const Center(child: Text('Login')),
            ),
          ),
          const SizedBox(height: 20),
          // login with Google
          Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
