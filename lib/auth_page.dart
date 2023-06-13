import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_info.dart';

import 'login.dart';
import 'Webpages/ProfilePage.dart';
import 'Webpages/AcceptancePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return StreamBuilder(
                stream: getCurrentUserData().asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (currentUserData["Acceptance"] == 0 ||
                      currentUserData["Acceptance"] == 3) {
                    return const ProfilePage();
                  }
                  return const AcceptancePage();
                });
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
