import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final formkey =GlobalKey<FormState>();

  void signUpUser(){
    if (formkey.currentState!.validate()) {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up. ",
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: "Name"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name field can not be empty";
                    
                  } 
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: "Email"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name field can not be empty";
                    
                  } return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: "Password"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name field can not be empty";
                    
                  } return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: signUpUser,
                child: Text(
                  "Sign Up.",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(height: 15),
              RichText(
                
                text: TextSpan(
                  
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [TextSpan(text: 'Sign In.')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
