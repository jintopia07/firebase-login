import 'package:firebaselogin/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Firebase"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      body:  loginUI(),
    );
  }



  loginUI(){

    return Consumer<LoginController>(builder: (context, model, child){
      if(model.userDetails != null){
            return Center(
              child: loggedInUI(model),
            ); 
      }else{
        return loginController(context);
      }
    });
  }


  loggedInUI(LoginController model) 
  {
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,


       children: [
         CircleAvatar(
           backgroundImage: Image.network(model.userDetails!.photoURL ?? "").image,
           radius: 50,
         ),


         Text(model.userDetails!.displayName ?? ""),
         Text(model.userDetails!.email ?? ""),


         //logout
         ActionChip(
           avatar: Icon(Icons.logout),
           label: Text("Logout"),
           onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
           },
         )
       ],
     );
  }


  loginController(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                 SizedBox(
                width: 220,
                child: FloatingActionButton.extended(
                  onPressed: () {
                   Provider.of<LoginController>(context, listen: false).googleLogin();
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
    );

  }
}
