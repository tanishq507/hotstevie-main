import 'package:flutter/material.dart';
import 'package:hotstevie/screens/AddNewObj.dart';
import 'package:hotstevie/screens/home_view.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          // Set background color
          color: Colors.blueGrey, // Example color
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username text field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              // Password text field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true, // Hide password text
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20), // Add spacing
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                  // Button action
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Text color
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // Button background color
                  primary: Colors.green, // Example color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
