import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider,PhoneAuthProvider;
import 'package:luvuphuc_firebase/widget_connect_firebase.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthAppDemo extends StatelessWidget {
  const AuthAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
      errorMessage: "Error",
      connectingMessage: "Connecting...",
      builder: (context) => const MaterialApp(
        home: PageSignIn(),
      ),
    );
  }
}
class PageSignIn extends StatelessWidget {
  const PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          return SignInScreen(
            showAuthActionSwitch: false,
            headerBuilder: (context, constraints, shrinkOffset) {
              return Container(
                padding: EdgeInsets.all(constraints.maxWidth * 0.1),
                child: Text("Đăng nhập",
                  style: TextStyle(
                    fontSize: 20 - (shrinkOffset * 0.1), // Example adjustment based on shrinkOffset
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(clientId: "307752435299-380273a4s4h9n3tblrgovtv68ecp12r2.apps.googleusercontent.com"),
              PhoneProviderConfiguration(),

            ],
          );
        return PageHomeAuth();
      },
    );
  }
}
class PageHomeAuth extends StatelessWidget {
  const PageHomeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Home Authentication"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Xin chào: ${user.displayName?? user.email ?? user.phoneNumber?? ""}"),
            Text("User Id: ${user.uid}"),
            ElevatedButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => PageSignIn(),), (route) => false);
                },
                child: Text("Sign Out")
            )],
        ),
      ),
    );
  }
}
