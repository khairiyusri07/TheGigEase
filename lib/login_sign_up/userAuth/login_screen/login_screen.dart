import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Screen/main_page.dart';
import '../../../model/Global.dart';
import '../../../Screen/homePage/home_screen.dart';
import '../forgot_password/forgot_password.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  //bool _isLoading = false;


  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim()
      ).then((auth) async {
        currentUser = auth.user;

        await Fluttertoast.showToast(msg: "successfully login!");
        Navigator.push(context, MaterialPageRoute(builder: (c) => MainPage()));
      }).catchError((errorMassage) {
        Fluttertoast.showToast(msg: "Error occured: \n $errorMassage");
      });
    }


    else {
      Fluttertoast.showToast(msg: "Not all field are valid");
    };
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                color: Colors.white,
              ),
              Image(image: AssetImage("assets/images/logo/Logo_ada_background.png")),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      // Username input
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Username',
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

                      SizedBox(height: 10),

                      // Password input
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          obscureText: ! _passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible =
                                    !_passwordVisible;
                                  });
                                },
                              )
                          ),
                          autovalidateMode: AutovalidateMode
                              .onUserInteraction,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Password can\'t be empty";
                            }
                            if (text.length < 6) {
                              return 'Please enter a valid password';
                            }
                            if (text.length > 49) {
                              return 'Password can\'t be more than 50 words';
                            }
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() {
                                passwordTextEditingController.text =
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
                                  'Log in',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                            ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Forgot Password link
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (c) => ForgotPassword()));
                          // Implement the "Forgot Password" logic here
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 70),

                      // Social login buttons
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SocialButton(text: 'Google', color: Colors.red),
                      //     SizedBox(width: 10),
                      //     SocialButton(text: 'Twitter', color: Colors.blue),
                      //     SizedBox(width: 10),
                      //     SocialButton(text: 'Facebook', color: Colors.indigo),
                      //   ],
                      // ),
                      SizedBox(height: 20),

                      // Sign Up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have one?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  )
                              );
                            },
                            child: Text(
                                "Sign Up",
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String text;
  final Color color;

  SocialButton({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Implement your social login logic here
        },
        child: Text(text),
      ),
    );
  }
}
