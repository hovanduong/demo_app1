import 'dart:math';

import 'package:demo_app/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildImage(),
          // email
          _buildInputEmail(),
          const SizedBox(height: 20),
          // passwork
          _buildInputPassword(),
          const SizedBox(height: 20),
          //buton Login
          _buildButtonLogin(),
          const SizedBox(height: 20),
          // login with Google
          _buildButtonLoginGoogle(),
        ],
      ),
    ));
  }

  Widget _buildImage() {
    return Center(
      child: SizedBox(
        height: 200,
        child: Image.network(
            'https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj'),
      ),
    );
  }

  Widget _buildInputEmail() {
    return TextField(
      controller: emailController,
      obscureText: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }

  Widget _buildInputPassword() {
    return TextField(
      obscureText: true,
      controller: passwordController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }

  Widget _buildButtonLogin() {
    return InkWell(
      onTap: () {
        if (checkLogin() == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          String error =
              'Tai khoan va mat khau khong hop le !! vui long kiem tra lai';
          showAlertDialog(context, error);
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
    );
  }

  Widget _buildButtonLoginGoogle() {
    return Container(
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ));
  }

  checkLogin() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return false;
    } else if (email.length < 5 || password.length < 5) {
      return false;
    }
    return true;
  }

  showAlertDialog(BuildContext context, String error) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Thông báo"),
      content: Text(error),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
