import 'package:firebaselogin/screen/login.dart';
import 'package:firebaselogin/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register/Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
              ),
              SizedBox(
                width: 220,
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.add),
                  label: Text(
                    "Register",
                    
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterScreen();
                    }));
                  },
                   backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 220,
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.login),
                  label: Text(
                    "Login",
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 220,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    GoogleSignIn().signIn();
                  },
                  label: Text("Login with Google"),
                  icon: Image.asset(
                    "assets/images/google.jpg",
                    height: 32,
                    width: 32,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20),
                SizedBox(
                  width: 220,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    GoogleSignIn().signIn();
                  },
                  label: Text("Login with Facebook"),
                  icon: Image.asset(
                    "assets/images/facebook.jpg",
                    height: 32,
                    width: 32,
                  ),
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
