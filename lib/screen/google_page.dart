import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/screen/home.dart';
import 'package:firebaselogin/widget/logged_in_widget.dart';
import 'package:flutter/material.dart';

class GooglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return LoggedInWidget();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return HomeScreen();
            }
          },
        ),
      );
}
