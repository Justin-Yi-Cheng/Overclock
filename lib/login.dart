import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final int duration = 800;
  double opacity = 0;

  bool accountMessage = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void changeOpacity() {
    Future.delayed(Duration(milliseconds: duration), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
      });
    });
  }

  Future<bool> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (context.mounted) {
        Navigator.pop(context);
        setState(() {
          accountMessage = false;
        });
      }
      return true;
    } on FirebaseAuthException catch (error) {
      if (email.text.trim() == "" && password.text.trim() == "") {
        accountMessage = false;
        return false;
      }
      switch (error.code) {
        case "unknown":
          setState(() {
            accountMessage = true;
          });
      }

      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: duration + 800),
    );
    animationController.forward();
    changeOpacity();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: appHeight,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(milliseconds: 4000),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            ),
            items: [
              "LoginImage1.jpg",
              "LoginImage2.jpg",
              "LoginImage3.jpg",
            ].map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.65),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: duration),
            child: Center(
              child: Transform(
                transform: Matrix4.translationValues(0.0, -60.0, 0.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: Text(
                    "Welcome to",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 2,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: duration),
            child: Center(
              child: Transform(
                transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: Text(
                    "Overclock",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textScaleFactor: 4.5,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: duration),
            child: Center(
              child: Transform(
                transform: Matrix4.translationValues(0.0, 60.0, 0.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      accountMessage = false;

                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => StatefulBuilder(
                          builder: (context, setState) {
                            return StreamBuilder(
                              stream: login().asStream(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                                }
                                return AlertDialog(
                                  elevation: 10.0,
                                  scrollable: true,
                                  title: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "Welcome Back!",
                                      style: GoogleFonts.lexend(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textScaleFactor: 1.25,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          "Username",
                                          style: GoogleFonts.lexend(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textScaleFactor: 1,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 20),
                                        child: SizedBox(
                                          width: 400,
                                          child: TextField(
                                            onSubmitted: (info) => login(),
                                            controller: email,
                                            style: GoogleFonts.lexend(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          "Password",
                                          style: GoogleFonts.lexend(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textScaleFactor: 1,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: SizedBox(
                                          width: 400,
                                          child: TextField(
                                            onSubmitted: (info) => login(),
                                            controller: password,
                                            obscureText: true,
                                            style: GoogleFonts.lexend(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: accountMessage,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 1.0, 0.0, 10.0),
                                          child: Text(
                                            "Incorrect Email / Password!",
                                            style: GoogleFonts.lexend(
                                              color: const Color.fromRGBO(
                                                  210, 41, 45, 1),
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textScaleFactor: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            login();
                                            debugPrint("$accountMessage");
                                            setState(() {});
                                          },
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: IntrinsicHeight(
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                    width: 2,
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Text(
                                                      "Sign In",
                                                      style: GoogleFonts.lexend(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textScaleFactor: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        color: const Color.fromRGBO(210, 41, 45, 1),
                        width: 150,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
