import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/controllers/login_controller.dart';
import 'package:firebaselogin/provider/google_sign_in.dart';
import 'package:firebaselogin/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context) => GoogleSignInProvider(),
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'Demo',
  //       theme: ThemeData(
    
  //         primarySwatch: Colors.blue,
  //       ),
  //       home: HomeScreen()
  //     ),
  //   );
  // }




   Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}


