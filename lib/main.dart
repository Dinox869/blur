import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blur/loginview.dart';
import 'package:blur/research.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blur/profile.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

Future main() async
{
  await SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blur',
      theme: ThemeData(
        primaryColorLight: Colors.grey,
        primaryColor: Colors.grey,
        primaryColorBrightness: Brightness.dark
      ),
    home: MyHomePage(),
    ) ;
  }
}

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePage createState() => _MyHomePage();

}
 class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin
 {
   final FirebaseAuth _auth = FirebaseAuth.instance;
   final GoogleSignIn googleSignIn = new GoogleSignIn();
   bool isLogged = false;
   FacebookLogin fblogin = new FacebookLogin();
   FirebaseUser myuser;

    Future<void> signOut() async {
     await fblogin.logOut();
     await _auth.signOut();

   }

   login() async {
     final facebookLogin = new FacebookLogin();
     final result = await facebookLogin.logInWithReadPermissions(['email']);
     FacebookAccessToken myToken = result.accessToken;
     switch (result.status) {
       case FacebookLoginStatus.loggedIn:
         AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: myToken.token);
         FirebaseUser myuser = await   FirebaseAuth.instance.signInWithCredential(credential);

         Navigator.push(context,MaterialPageRoute(builder: (context)=>
         loginview(User : myuser)
         ));
         break;
       case FacebookLoginStatus.cancelledByUser:
         print('CANCELED BY USER');
         break;
       case FacebookLoginStatus.error:
         print(result.errorMessage);
         break;
     }
   }


   Future<FirebaseUser> _SignIn() async {

     GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
     GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;

      final AuthCredential credential  = GoogleAuthProvider.getCredential(
          idToken: gsa.idToken,
          accessToken: gsa.accessToken);

      final FirebaseUser user = await _auth.signInWithCredential(credential);
      print("signed in "+ user.displayName);
      return user;
   }
   void _logOut() async {
     await _auth.signOut().then((response) {
       isLogged = false;
       setState(() {});
     });
   }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.grey),
        padding: EdgeInsets.only( top: 5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("BLUR",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 75.0
              )
                ,),
              SizedBox(height: 30.0,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white30
                ),
                constraints: BoxConstraints(
                  minWidth: 150.0,
                  maxWidth: 300.0
                ),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0 ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FacebookSignInButton(
                        onPressed: () {
                          //
                          login();
                        }
                      ),
                      GoogleSignInButton(
                        onPressed: (){
                          //
                          _SignIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          research()
                          ));
                        },
                      ),
                      TwitterSignInButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          research()
                          ));

                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 }





