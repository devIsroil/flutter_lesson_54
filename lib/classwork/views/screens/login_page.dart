// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_lesson_54/classwork/views/screens/register_page.dart';
// import 'package:flutter_lesson_54/classwork/views/widgets/sized_box_extension.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// import 'last_page.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   String errorMessage = "";
//
//   final List<Map<String, String>> registeredUsers = [
//     {'email': 'user1@example.com', 'password': 'password1'},
//     {'email': 'user2@example.com', 'password': 'password2'},
//   ];
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   void _login() {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       setState(() {
//         errorMessage = "Please fill in all required sections";
//       });
//     } else if (!email.contains("@")) {
//       setState(() {
//         errorMessage = "Please enter a valid email";
//       });
//     } else {
//       bool userFound = registeredUsers.any((user) =>
//       user['email'] == email && user['password'] == password);
//
//       if (userFound) {
//         Navigator.of(context)
//             .pushReplacement(MaterialPageRoute(builder: (ctx) => const LastPage()));
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text("Error"),
//               content: const Text("Siz ro'yxatdan o'tmagansiz"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text("OK"),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login Page"),),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               60.height(),
//               // Text(
//               //   "Welcome back",
//               //   style: TextStyle(
//               //       color: Colors.black,
//               //       fontWeight: FontWeight.bold,
//               //       fontSize: 24.sp),
//               // ),
//               // 10.height(),
//               // Text(
//               //   "Let's Login to Connect your email",
//               //   style: TextStyle(
//               //       color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
//               // ),
//               15.height(),
//               TextField(
//                 controller: emailController,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   hintText: "name@example.com",
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//                 //errorText: errorMessage.isEmpty ? null : errorMessage,
//               ),
//               15.height(),
//               TextField(
//                 controller: passwordController,
//                 keyboardType: TextInputType.text,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(Icons.vpn_key_outlined),
//                   suffixIcon: const Icon(CupertinoIcons.eye_slash),
//                   hintText: "**************",
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               Text(
//                 errorMessage,
//                 style: const TextStyle(color: Colors.red),
//               ),
//               Text(
//                 "Forget your password ?",
//                 style: TextStyle(
//                     color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
//               ),
//               30.height(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account? ",
//                     style: TextStyle(
//                         color: Colors.black.withOpacity(0.5), fontSize: 16.sp),
//                   ),
//                   Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => RegisterPage()));
//                         },
//                         child: Text(
//                           "Sign up here",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               170.height(),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _login,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 20),
//                     backgroundColor: const Color(0xff4155FA),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       //fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   child: const Text("Log in"),
//                 ),
//               ),
//               10.height(),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     ZoomTapAnimation(
//               //       child: Container(
//               //         padding: const EdgeInsets.all(15),
//               //         width: 150.w,
//               //         height: 60.r,
//               //         decoration: BoxDecoration(
//               //             color: Colors.grey.withOpacity(0.2),
//               //             borderRadius: BorderRadius.circular(10.r)),
//               //         child: Padding(
//               //           padding: const EdgeInsets.symmetric(horizontal: 22),
//               //           child: Row(
//               //             children: [
//               //               Image.asset("assets/images/apple-logo.png"),
//               //               5.width(),
//               //               const Text(
//               //                 "Apple",
//               //                 style: TextStyle(color: Colors.black, fontSize: 18),
//               //               )
//               //             ],
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //     20.width(),
//               //     ZoomTapAnimation(
//               //       child: Container(
//               //         padding: const EdgeInsets.all(16),
//               //         width: 150.w,
//               //         height: 60.r,
//               //         decoration: BoxDecoration(
//               //             color: Colors.grey.withOpacity(0.2),
//               //             borderRadius: BorderRadius.circular(10.r)),
//               //         child: Padding(
//               //           padding: const EdgeInsets.symmetric(horizontal: 17),
//               //           child: Row(
//               //             children: [
//               //               Image.asset("assets/images/google.png"),
//               //               5.width(),
//               //               const Text(
//               //                 "Google",
//               //                 style: TextStyle(color: Colors.black, fontSize: 18),
//               //               )
//               //             ],
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               20.height(),
//               // Center(
//               //   child: RichText(
//               //     text: TextSpan(
//               //       children: [
//               //         TextSpan(
//               //           text: "By continuing you agree to Loana's\n    ",
//               //           style: TextStyle(
//               //               color: Colors.black.withOpacity(0.5),
//               //               fontSize: 16.sp),
//               //         ),
//               //         TextSpan(
//               //           text: "Terms of Use ",
//               //           style: TextStyle(
//               //               color: Colors.black,
//               //               fontSize: 16.sp,
//               //               fontWeight: FontWeight.w500),
//               //         ),
//               //         TextSpan(
//               //           text: "& ",
//               //           style: TextStyle(
//               //             color: Colors.black.withOpacity(0.6),
//               //             fontSize: 16.sp,
//               //           ),
//               //         ),
//               //         TextSpan(
//               //           text: "Privacy Policy",
//               //           style: TextStyle(
//               //               color: Colors.black,
//               //               fontSize: 16.sp,
//               //               fontWeight: FontWeight.w500),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }