import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/screen/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final  auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(auth.currentUser!.email!),
              SizedBox(height: 20),
              SizedBox(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    });
                  },
                  label: Text("Logout"),
                  icon: Icon(Icons.logout),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
