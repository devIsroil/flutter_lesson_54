import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
              },
              child: const Padding(
                padding:  EdgeInsets.only(right: 20),
                child: Icon(Icons.exit_to_app_outlined),
              )),
        ],
      ),
      body: const Center(
        child: Text(
          "HomeScreen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
