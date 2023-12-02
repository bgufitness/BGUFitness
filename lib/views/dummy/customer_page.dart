import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Customer Page",style: TextStyle(fontSize: 20)),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'mainScreen');
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
