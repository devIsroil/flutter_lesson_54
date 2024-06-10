
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson_54/classwork/views/widgets/sized_box_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'last_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              // Text(
              //   "Register",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 24.sp,
              //   ),
              // ),
              // SizedBox(height: 10.h),
              // Text(
              //   "Create your account for your schedule",
              //   style: TextStyle(
              //     color: Colors.black.withOpacity(0.5),
              //     fontSize: 15.sp,
              //   ),
              // ),
              SizedBox(height: 15.h),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(CupertinoIcons.person),
                  hintText: "Your name",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Your Email",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  suffixIcon: Icon(CupertinoIcons.eye_slash),
                  hintText: "**************",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: password2Controller,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  suffixIcon: Icon(CupertinoIcons.eye_slash),
                  hintText: "**************",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You have an account ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16.sp,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                        },
                        child: Text(
                          "Sign in here",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 120.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String password2 = password2Controller.text.trim();
                    String name = nameController.text.trim();

                    if (email.isEmpty ||
                        password.isEmpty ||
                        name.isEmpty ||
                        password2.isEmpty) {
                      setState(() {
                        errorMessage = "Please fill in all required fields.";
                      });
                      return;
                    } else if (!email.contains("@")) {
                      setState(() {
                        errorMessage = "Please enter a valid email";
                      });
                      return;
                    } else if (password != password2) {
                      setState(() {
                        errorMessage = "Passwords do not match";
                      });
                      return;
                    }

                    // Registration logic goes here

                    // Show success dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          icon: Icon(Icons.check, color: Color(0xff4155FA), size: 60),
                          title: Center(child: Text("Your account has active", style: TextStyle(color: Colors.black, fontSize: 20.sp))),
                          content: Text("Congratulations! You have successfully changed your profile.", textAlign: TextAlign.center),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Navigate to the next page
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) {
                                    return const LastPage();
                                  }),
                                );
                              },
                              child: Container(
                                width: 265.w,
                                height: 60.r,
                                decoration: BoxDecoration(
                                  color: Color(0xff4155FA),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color(0xff4155FA),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
              20.height(),
              // Center(
              //   child: RichText(
              //     text: TextSpan(
              //       children: [
              //         TextSpan(
              //           text: "By continuing you agree to Loana's\n    ",
              //           style: TextStyle(
              //               color: Colors.black.withOpacity(0.5),
              //               fontSize: 16.sp),
              //         ),
              //         TextSpan(
              //           text: "Terms of Use ",
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         TextSpan(
              //           text: "& ",
              //           style: TextStyle(
              //             color: Colors.black.withOpacity(0.6),
              //             fontSize: 16.sp,
              //           ),
              //         ),
              //         TextSpan(
              //           text: "Privacy Policy",
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}