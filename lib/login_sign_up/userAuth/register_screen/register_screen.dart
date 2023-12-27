// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../Screen/main_page.dart';
import '../../../model/Global.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential? userCredential;

      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((auth) async {
        currentUser = auth.user;
        if (currentUser != null) {
          Map userMap = {
            "id": currentUser!.uid,
            "name": firstNameTextEditingController.text.trim(),
            "email": emailTextEditingController.text.trim(),
            "phone": phoneTextEditingController.text.trim(),
          };

          CollectionReference collRef = FirebaseFirestore.instance.collection('users');
          collRef.add({
            'authUid': currentUser!.uid,
            'email': email,
            'balance': 0.0, // Set an initial balance
            'first name': firstNameTextEditingController.text.trim(),
            'last name': lastNameTextEditingController.text.trim(),
            'phone': phoneTextEditingController.text.trim(),
            'address' : addressTextEditingController.text.trim(),
            'JobRating' : 0.0,
            'EmployerRating' : 0.0,
          });
          await Fluttertoast.showToast(msg: "successfully Registered!");
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => LoginScreen()));
        }
      }).catchError((errorMassage) {
        Fluttertoast.showToast(msg: "Error occurred: \n $errorMassage");
      });
    } catch (e) {
      print(e);
    }
  }
  void _sentToDb() async{

  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Use the signUp function here instead of the code you had before
      await signUp(
        emailTextEditingController.text.trim(),
        passwordTextEditingController.text.trim(),
      );
    } else {
      Fluttertoast.showToast(msg: "Not all fields are valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark; //check system punya theme



    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create New Account"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // Center(
            //   child: Text(
            //     "Registration",
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.primary,
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profilePic/blank-profile-picture.png'),

                  ),

                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 40,
                      width: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color:  Colors.white,
                          )
                      ),
                    ),
                  )
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),

                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary,)
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if(text == null || text.isEmpty){
                              return "Name can\'t be empty";
                            }
                            if(text.length < 2) {
                              return 'Please enter a valid name';
                            }
                            if(text.length > 49){
                              return 'Name can\'t be more than 49 words';
                            }
                          },
                          onChanged: (text) => setState(() {
                            firstNameTextEditingController.text = text;
                          }
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),

                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary,)
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if(text == null || text.isEmpty){
                              return "Name can\'t be empty";
                            }
                            if(text.length < 2) {
                              return 'Please enter a valid name';
                            }
                            if(text.length > 49){
                              return 'Name can\'t be more than 49 words';
                            }
                          },
                          onChanged: (text) => setState(() {
                            lastNameTextEditingController.text = text;
                          }
                          ),
                        ),
                        const SizedBox(height: 10),


                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: const TextStyle(
                                color: Colors.grey,

                              ),
                              filled: true,
                              fillColor:   Colors.grey.shade200,                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.email, color: Theme.of(context).colorScheme.primary,)
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if(text == null || text.isEmpty){
                              return "E-mail can\'t be empty";
                            }
                             if(EmailValidator.validate(text) == true) {
                               return null;
                            }
                            if(text.length < 2) {
                              return 'Please enter a valid E-mail';
                            }
                            if(text.length > 99){
                              return 'E-mail can\'t be more than 99 words';
                            }
                          },
                          onChanged: (text) => setState(() {
                            emailTextEditingController.text = text;
                          }
                          ),

                        ),
                        const SizedBox(height: 10,),

                        IntlPhoneField(
                            showCountryFlag: false ,
                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: const TextStyle(
                                color: Colors.grey,

                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                            ),
                            initialCountryCode: '+60',
                            onChanged: (text) => setState(() {
                              phoneTextEditingController.text = text.completeNumber;
                            }
                            )
                        ),

                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'Address',
                              hintStyle: const TextStyle(
                                color: Colors.grey,

                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.home, color: Theme.of(context).colorScheme.primary,)
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if(text == null || text.isEmpty){
                              return "Address can\'t be empty";
                            }
                            if(text.length < 2) {
                              return 'Please enter a valid address';
                            }
                            if(text.length > 99){
                              return 'Address can\'t be more than 100 words';
                            }
                          },
                          onChanged: (text) => setState(() {
                            addressTextEditingController.text = text;
                          }
                          ),
                        ),
                        const SizedBox(height: 20,),





                        TextFormField(
                          obscureText: ! _passwordVisible,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,

                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 01,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.password, color: Theme.of(context).colorScheme.primary,),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            if(text == null || text.isEmpty){
                              return "Password can\'t be empty";
                            }
                            if(text.length < 6) {
                              return 'Please enter a valid password';
                            }
                            if(text.length > 49){
                              return 'Password can\'t be more than 50 words';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            passwordTextEditingController.text = text;
                          }
                          ),
                        ),
                        const SizedBox(height: 20,),


                        TextFormField(
                          obscureText: ! _passwordVisible,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                              hintText: 'Confirm password',
                              hintStyle: const TextStyle(
                                color: Colors.grey,

                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  )
                              ),
                              prefixIcon: Icon(Icons.password, color: Theme.of(context).colorScheme.primary,),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) {
                            // if(text == passwordTextEditingController){
                            //   return 'Password is not mathched';
                            // }

                            if(text == null || text.isEmpty){
                              return "Confirm password can\'t be empty";
                            }
                            if(text.length < 6) {
                              return 'Please enter a valid password confirmation';
                            }
                            if(text.length > 49){
                              return 'Confirm password can\'t be more than 50 words';
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            //passwordTextEditingController.text = text;
                          }
                          ),
                        ),
                        const SizedBox(height: 20,),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            onPrimary:  Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(double.infinity,50),
                          ),
                          onPressed: () {
                            _submit();

                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20,),

                      ],

                    )

                  )
                ],
              ),

            )
          ],
        ),
      ),

    );
  }
}
