import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const Text("Sign Up. ",style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          TextFormField(controller: emailcontroller,
          decoration: InputDecoration(
            hintText: "Name"
          ),
          ),
          SizedBox(height: 15,),
          TextFormField(controller: emailcontroller,
          decoration: InputDecoration(
            hintText: "Email"
          ),
          ),
          SizedBox(height: 15,),
          TextFormField(controller: emailcontroller,
          decoration: InputDecoration(
            hintText: "Password"
          ),
          ),
          
        ],
      ),
    );
  }
}