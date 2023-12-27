import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/Global.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit () {
    firebaseAuth.sendPasswordResetEmail(email: emailTextEditingController.text.trim()
    ).then((value){
      Fluttertoast.showToast(msg: "We have sent you an email to recover password, please check your email");
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "Error occured: \n ${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 10),
            Image(image: AssetImage("assets/images/logo/Logo_ada_background.png")),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 50),
               child: Column(

                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   Text(
                     "Please enter your email to reset your password",
                     style: TextStyle(
                       color: Theme.of(context).colorScheme.primary,
                       fontSize: 18,
                       fontWeight: FontWeight.normal,
                     ),
                   ),
                 ],
               ),
             ),

            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  // Username input
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '   Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "E-mail can\'t be empty";
                        }
                        if (EmailValidator.validate(text) ==
                            true) {
                          return null;
                        }
                        if (text.length < 2) {
                          return 'Please enter a valid E-mail';
                        }
                        if (text.length > 99) {
                          return 'E-mail can\'t be more than 99 words';
                        }
                      },
                      onChanged: (text) =>
                          setState(() {
                            emailTextEditingController.text =
                                text;
                          }
                          ),

                    ),
                  ),
                  SizedBox(height: 30),
                  // Login button
                  Container(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(double.infinity,50),
                      ),
                      onPressed: () {
                        _submit();
                      },
                      child : Text(
                        'Send link now',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
