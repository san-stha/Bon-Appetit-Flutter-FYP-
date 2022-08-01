// ignore_for_file: prefer_final_fields, unnecessary_new, unused_local_variable, prefer_const_constructors, duplicate_ignore, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/api/api.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/controllers.dart';
import 'package:fyp/view/login/login.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPassword = true;
  bool showConfirmPassword = true;
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Container(
                color: AppSetting.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Image.asset(
                          "images/logo.png",
                          width: width,
                        ),
                      ),

                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BAPTText(
                          text: "Sign Up",
                          color: AppSetting.ancentText,
                        ),
                      ),

                      // first name
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppSetting.ancentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  focusColor: AppSetting.ancentColor,
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "First Name",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppSetting.secondaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3))),
                              validator: (value) =>
                                  value!.isEmpty ? 'required' : null,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                      ),

                      //last name
                      // TextFormField(
                      //   controller: lastName,
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.white,
                      //       labelText: 'Last Name',
                      //       prefixIcon: Icon(Icons.person)),
                      //   validator: (value) =>
                      //       value!.isEmpty ? 'required' : null,
                      //   keyboardType: TextInputType.text,
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 4),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(4)),
                      //       color: AppSetting.ancentColor,
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(4.0),
                      //       child: TextFormField(
                      //         controller: lastName,
                      //         decoration: InputDecoration(
                      //             focusColor: AppSetting.ancentColor,
                      //             prefixIcon: Icon(Icons.person),
                      //             labelText: "Last Name",
                      //             enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     width: 2,
                      //                     color: AppSetting.secondaryColor)),
                      //             focusedBorder: OutlineInputBorder(
                      //               borderSide: BorderSide(
                      //                   width: 3, color: Colors.black),
                      //               // borderRadius: BorderRadius.circular(15),
                      //             ),
                      //             errorBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     color: Colors.red, width: 3))),
                      //         validator: (value) =>
                      //             value!.isEmpty ? 'required' : null,
                      //         keyboardType: TextInputType.text,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppSetting.ancentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: phoneNumber,
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppSetting.secondaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3))),
                              validator: (value) =>
                                  value!.isEmpty ? 'required' : null,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ),

                      //email textformfield
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppSetting.ancentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppSetting.secondaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3))),
                              validator: (value) =>
                                  value!.isEmpty ? 'required' : null,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                      ),

                      // password textformfield
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppSetting.ancentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        showPassword = !showPassword;
                                        setState(() {});
                                      },
                                      icon: showPassword == false
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppSetting.secondaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3))),
                              validator: (value) =>
                                  value!.isEmpty ? 'required' : null,
                              keyboardType: TextInputType.text,
                              obscureText: showPassword,
                            ),
                          ),
                        ),
                      ),

                      //confirm password textformfield
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppSetting.ancentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: confirmPassword,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        showConfirmPassword =
                                            !showConfirmPassword;
                                        setState(() {});
                                      },
                                      icon: showPassword == false
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppSetting.secondaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 3))),
                              validator: (value) =>
                                  value!.isEmpty ? 'required' : null,
                              keyboardType: TextInputType.text,
                              obscureText: showPassword,
                            ),
                          ),
                        ),
                      ),

                      //Register Button
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          minWidth: width * .90,
                          height: 60,
                          color: AppSetting.secondaryColor,
                          textColor: Colors.white,
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              if (password.text != confirmPassword.text){
                                return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: BAPTText(text: "Error!!".toUpperCase(), color: Colors.red, fontWeight: FontWeight.bold,),
                                        // content: Text(result['message']),
                                        content: Text("Password and confirm password doesn't match!"),
                                        actions: [
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        AppSetting
                                                            .primaryColor),
                                              ),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                                Get.back();
                                              },
                                              child: BAPTText(text: "OK", color: Colors.white,))
                                        ],
                                      );
                                    });
                              }

                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      String passv = r'(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$)';
                      RegExp regExp = new RegExp(patttern);
                      RegExp regPass = new RegExp(passv);
                      if (name.text.isEmpty ||
                          email.text.isEmpty ||
                          phoneNumber.text.isEmpty ||
                          password.text.isEmpty) {
                        errorSnackbar("Please fill all the fields");
                      }
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)){
                         errorSnackbar("Email format incorrect");
                      }
                      else if (!regExp.hasMatch(phoneNumber.text)

                      ){
                        errorSnackbar("Please Enter Valid Phone Number");

                      }
                      else if(!regPass.hasMatch(password.text)){
                        errorSnackbar("Your password must have a minimum strength of strong");
                      } else{
                              Map data = {
                                "name": name.text,
                                "email": email.text,
                                "password": password.text,
                                "phone_number": phoneNumber.text,
                                "character": 0
                              };

                              var response = await Api()
                                  .loginAndRegister(data, 'register');
                              var result = json.decode(response.body);
                              print(response.statusCode);
                              print(result);
                              if (response.statusCode == 201) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        backgroundColor: AppSetting.ancentColor,
                                        title: BAPTText(
                                            text: "Registration Successful. "),
                                        content: Text(result['message']),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Get.off(() => Login());
                                              },
                                              child: BAPTText(
                                                text: "OK",
                                                color:
                                                    AppSetting.secondaryColor,
                                              ))
                                        ],
                                      );
                                    });
                              } else {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: BAPTText(text: "Error!!".toUpperCase(), color: Colors.red, fontWeight: FontWeight.bold,),
                                        content: Text(result['message']),
                                        // content: Text("Phone nuumber same"),
                                        actions: [
                                          ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        AppSetting
                                                            .primaryColor),
                                              ),
                                              onPressed: () {
                                                // Navigator.pop(context);
                                                Get.back();
                                              },
                                              child: BAPTText(text: "OK", color: Colors.white,))
                                        ],
                                      );
                                    });
                              }
                            }
                          }
                          },
                          child: BAPTText(
                            text: "Register",
                            color: AppSetting.ancentColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
