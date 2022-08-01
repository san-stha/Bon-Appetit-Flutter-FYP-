// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fyp/api/api.dart';
// import 'package:fyp/components/bapt_text.dart';
// import 'package:fyp/const/app_settings.dart';
// import 'package:fyp/const/controllers.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool showPassword = true;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             color: AppSetting.primaryColor,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "images/logo.png",
//                     width: width,
//                     height: height * .20,

//                   ),
//                   SizedBox(
//                     height: height * 0.20,
//                     child: BAPTText(
//                       text: "Sign In",
//                       color: AppSetting.ancentColor,
//                       fontSize: 18,
//                     ),
//                     // height: MediaQuery.of(context).size.height
//                   ),
//                   Container(
//                   height: height * 0.20,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(4)),
//                       color: AppSetting.ancentColor,
//                     ),
//                     child: TextFormField(
//                       controller: email,
//                       decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: Icon(Icons.email),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 2,
//                                   color: AppSetting.secondaryColor)),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 3, color: Colors.black),
//                             // borderRadius: BorderRadius.circular(15),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.red, width: 3))),
//                       validator: (value) =>
//                           value!.isEmpty ? 'required' : null,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),

//                   // Container(
//                   // height: height * 0.20,
//                   //   decoration: BoxDecoration(
//                   //     borderRadius: BorderRadius.all(Radius.circular(4)),
//                   //     color: AppSetting.ancentColor,
//                   //   ),
//                   //   child: TextFormField(
//                   //     controller: password,
//                   //     decoration: InputDecoration(
//                   //         prefixIcon: Icon(Icons.lock),
//                   //         labelText: 'Password',
//                   //         suffixIcon: IconButton(
//                   //             onPressed: () {
//                   //               showPassword = !showPassword;
//                   //               setState(() {});
//                   //             },
//                   //             icon: showPassword == false
//                   //                 ? Icon(Icons.visibility_off)
//                   //                 : Icon(Icons.visibility)),
//                   //         enabledBorder: OutlineInputBorder(
//                   //             borderSide: BorderSide(
//                   //                 width: 2,
//                   //                 color: AppSetting.secondaryColor)),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderSide:
//                   //               BorderSide(width: 3, color: Colors.black),
//                   //           // borderRadius: BorderRadius.circular(15),
//                   //         ),
//                   //         errorBorder: OutlineInputBorder(
//                   //             borderSide:
//                   //                 BorderSide(color: Colors.red, width: 3))),
//                   //     validator: (value) =>
//                   //         value!.isEmpty ? 'required' : null,
//                   //     keyboardType: TextInputType.text,
//                   //     obscureText: showPassword,
//                   //   ),
//                   // ),

//                   // TextFormField(
//                   //   controller: email,
//                   //   decoration: InputDecoration(labelText: 'Email', suffixIcon: Icon(Icons.email)),
//                   //   validator: (value) => value!.isEmpty ? 'required' : null,
//                   //   keyboardType: TextInputType.emailAddress,
//                   // ),
//                   // TextFormField(
//                   //   controller: password,
//                   //   decoration: InputDecoration(
//                   //       labelText: 'Password',
//                   //       suffixIcon: IconButton(
//                   //           onPressed: () {
//                   //             showPassword = !showPassword;
//                   //             setState(() {});
//                   //           },
//                   //           icon: showPassword == false ? Icon(Icons.visibility_off) : Icon(Icons.visibility))),
//                   //   validator: (value) => value!.isEmpty ? 'required' : null,
//                   //   keyboardType: TextInputType.text,
//                   //   obscureText: showPassword,
//                   // ),

//                   SizedBox(
//                     height: height *.20,

//                   ),
//                   // login button
//                   MaterialButton(
//                     minWidth: width * .90,

//                     color: AppSetting.secondaryColor,
//                     // textColor: Colors.white,
//                     onPressed: () async {
//                       // Navigator.popAndPushNamed(context, 'dashboard');

//                       Map data = {
//                         "email": email.text,
//                         "password": password.text
//                       };

//                       var response =
//                           await Api().loginAndRegister(data, 'login');
//                       var result = json.decode(response.body);
//                       print(result);

//                       if (response.statusCode == 200) {
//                         print(result['data']['token']);
//                         print(response.statusCode);
//                         // Save Token in Local storage
//                         SharedPreferences preferences =
//                             await SharedPreferences.getInstance();
//                         preferences.setString(
//                             'token', result['data']['token']);
//                         preferences.setString('email', email.text);
//                         preferences.setString('password', password.text);
//                         Navigator.popAndPushNamed(context, 'dashboard');
//                       } else {
//                         showDialog(
//                             context: context,
//                             builder: (builder) {
//                               return AlertDialog(
//                                 title: Text(
//                                   "Error",
//                                   style: TextStyle(
//                                       color: AppSetting.primaryColor),
//                                 ),
//                                 content: Text(result['message']),
//                                 actions: [
//                                   MaterialButton(
//                                       color: AppSetting.primaryColor,
//                                       textColor: Colors.white,
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Text("OK"))
//                                 ],
//                               );
//                             });
//                       }
//                     },
//                     child: BAPTText(
//                       text: "Login",
//                       color: AppSetting.ancentColor,
//                       fontSize: 18,
//                     ),
//                   ),

//                   InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(context, 'register');
//                     },
//                     child: RichText(
//                       text: const TextSpan(
//                         style: TextStyle(color: Colors.white),
//                         children: [
//                           TextSpan(
//                             text: "Don't Have an Account? ",
//                           ),
//                           TextSpan(
//                             text: 'Sign Up Here ',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppSetting.secondaryColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   // MaterialButton(
//                   //   onPressed: () {
//                   //     Navigator.popAndPushNamed(context, 'dashboard');
//                   //   },
//                   //   child: Text("Skip Now"),
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/api/api.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/controllers.dart';
import 'package:fyp/controller/coupon_controller.dart';
import 'package:fyp/controller/gems_points_controller.dart';
import 'package:fyp/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:fyp/view/dashboard/dashboard.dart';
import 'package:fyp/view/register/register.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/view/global/global.dart' as globals;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    var gp = Get.find<GemsPointsController>();
    var cp = Get.find<CouponController>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: AppSetting.primaryColor,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    "images/logo.png",
                    width: width,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BAPTText(
                      text: "Sign In",
                      color: AppSetting.ancentText,
                    ),
                  ),
                  // TextFormField(
                  //   controller: email,
                  //   decoration: InputDecoration(
                  //       labelText: 'Email', suffixIcon: Icon(Icons.email)),
                  //   validator: (value) => value!.isEmpty ? 'required' : null,
                  //   keyboardType: TextInputType.emailAddress,
                  // ),

                  // TextFormField(
                  //   controller: password,
                  //   decoration: InputDecoration(
                  //       labelText: 'Password',
                  //       suffixIcon: IconButton(
                  //           onPressed: () {
                  //             showPassword = !showPassword;
                  //             setState(() {});
                  //           },
                  //           icon: showPassword == false
                  //               ? Icon(Icons.visibility_off)
                  //               : Icon(Icons.visibility))),
                  //   validator: (value) => value!.isEmpty ? 'required' : null,
                  //   keyboardType: TextInputType.text,
                  //   obscureText: showPassword,
                  // ),

                  // SizedBox(
                  //   height: 10,
                  // ),

                  //email tetxtformfiled
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
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 3))),
                          validator: (value) =>
                              value!.isEmpty ? 'required' : null,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ),

                  //password textformfield
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: AppSetting.ancentColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    showPassword = !showPassword;
                                    setState(() {});
                                  },
                                  icon: showPassword == false
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: AppSetting.secondaryColor)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                                // borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 3))),
                          validator: (value) =>
                              value!.isEmpty ? 'required' : null,
                          keyboardType: TextInputType.text,
                          obscureText: showPassword,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      // Expanded(
                      //   // login button
                      //   child: MaterialButton(
                      //     color: AppSetting.secondaryColor,
                      //     textColor: Colors.white,
                      //     onPressed: () async {
                      //       Map data = {
                      //         "email": email.text,
                      //         "password": password.text
                      //       };

                      //       var response =
                      //           await Api().loginAndRegister(data, '/login');
                      //       var result = json.decode(response.body);
                      //       print(result);

                      //       if (response.statusCode == 200) {
                      //         print(result['data']['token']);
                      //         print(response.statusCode);
                      //         // Save Token in Local storage
                      //         SharedPreferences preferences =
                      //             await SharedPreferences.getInstance();
                      //         preferences.setString(
                      //             'token', result['data']['token']);
                      //         preferences.setString('email', email.text);
                      //         preferences.setString('password', password.text);
                      //         Get.off(() => HomePage());
                      //       } else {
                      //         showDialog(
                      //             context: context,
                      //             builder: (builder) {
                      //               return AlertDialog(
                      //                 title: Text(
                      //                   "Error",
                      //                   style: TextStyle(
                      //                       color: AppSetting.primaryColor),
                      //                 ),
                      //                 content: Text(result['message']),
                      //                 actions: [
                      //                   MaterialButton(
                      //                       color: AppSetting.primaryColor,
                      //                       textColor: Colors.white,
                      //                       onPressed: () {
                      //                         Get.back();
                      //                       },
                      //                       child: Text("OK"))
                      //                 ],
                      //               );
                      //             });
                      //       }
                      //     },
                      //     child: Text("LOGIN"),
                      //   ),
                      // ),

                      Expanded(
                        // login button
                        // child: MaterialButton(
                        //   color: AppSetting.primaryColor,
                        //   textColor: Colors.white,
                        //   onPressed: () async {
                        //     Map data = {
                        //       "username": email.text,
                        //       "password": password.text
                        //     };

                        //     var response = await Api()
                        //         .loginAndRegister(data, '/efn/customer/login');
                        //     var result = json.decode(response.body);
                        //     print(result);

                        //     if (response.statusCode == 200) {
                        //       print(result['data']['token']);
                        //       print(response.statusCode);
                        //       // Save Token in Local storage
                        //       SharedPreferences preferences =
                        //           await SharedPreferences.getInstance();
                        //       preferences.setString(
                        //           'token', result['data']['token']);
                        //       preferences.setString('username', email.text);
                        //       preferences.setString('password', password.text);
                        //       Navigator.popAndPushNamed(context, 'dashboard');
                        //     } else {
                        //       showDialog(
                        //           context: context,
                        //           builder: (builder) {
                        //             return AlertDialog(
                        //               title: Text(
                        //                 "Error",
                        //                 style: TextStyle(
                        //                     color: AppSetting.primaryColor),
                        //               ),
                        //               content: Text(result['message']),
                        //               actions: [
                        //                 MaterialButton(
                        //                     color: AppSetting.primaryColor,
                        //                     textColor: Colors.white,
                        //                     onPressed: () {
                        //                       Navigator.pop(context);
                        //                     },
                        //                     child: Text("OK"))
                        //               ],
                        //             );
                        //           });
                        //     }
                        //   },
                        //   child: Text("LOGIN"),
                        // ),

                        child: MaterialButton(
                          color: AppSetting.secondaryColor,
                          textColor: AppSetting.ancentText,
                          onPressed: () async {
                            Map data = {
                              "email": email.text,
                              "password": password.text
                            };

                            var response =
                                await Api().loginAndRegister(data, 'login');
                            var result = json.decode(response.body);
                            print(result);
                            print(response.statusCode);

                            if (response.statusCode == 200) {
                              // Save Token in Local storage
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString('token', result['token']);
                              cp.getCouponList();
                              gp.getGemsPoints();
                              print("this is gem points");
                              print(gp.gemsPoints.value.points);
                              // gp.gemsPoints.value.points = globals.gemPoints;
                              Get.off(() => Bottom_nav_bar());
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content:
                                          Text("Invalid email or password"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
                            }
                          },
                          child: const Text(
                            "LOGIN",
                            style:
                                TextStyle(fontSize: 24, fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, 'register');
                      Get.to(() => const Register());
                    },
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Don't Have an Account? ",
                          ),
                          TextSpan(
                            text: 'Sign Up Here ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppSetting.ancentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      onPressed: () {
                        // Navigator.popAndPushNamed(context, 'dashboard');jkh
                        Get.off(() => Bottom_nav_bar());
                      },
                      child: const BAPTText(
                        text: "Skip now",
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
