import 'package:flutter/material.dart';
import 'package:hotstevie/screens/custom_icons.dart';
import 'package:hotstevie/screens/dashboard.dart';
import 'package:hotstevie/screens/dashboardLanding.dart';
import 'package:hotstevie/screens/displayQR.dart';
import 'package:hotstevie/screens/home_body.dart';
import 'package:hotstevie/screens/camera_screen.dart'; // Import the camera screen

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: CustomIcons(),
        ),
        actions: [
          // Add the camera icon button
          GestureDetector(
            onTap: () {
              // Navigate to the camera screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRQR()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 20),
          // Add the user avatar
          GestureDetector(
            // backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.brown,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHomeScreen()),
              );
            },
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
