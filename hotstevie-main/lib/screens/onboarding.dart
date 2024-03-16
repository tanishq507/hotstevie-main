import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotstevie/options/firestore.dart';
import 'package:hotstevie/screens/LoginPage.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to किसान सहाय्यक',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color is black
                ),
              ),
              SizedBox(height: 32),
              Image.asset(
                'assets/log.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Handle login button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[700], // Olive green color for button
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle signup button press
                  FirebaseStorageService().addUser({
                    'name': 'Stevie',
                    'email': 'email@mail,co',
                },);
                },
                style: TextButton.styleFrom(
                  primary:
                      Colors.green[700], // Olive green color for text button
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
